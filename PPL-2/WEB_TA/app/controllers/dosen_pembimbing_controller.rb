require 'set'

class DosenPembimbingController < ApplicationController
  #Nanti Yudis The Hacker nya diganti siapa yang lagi log in
  #atau mungkin NIP dosen

  def mahasiswa_ajukan_topik
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @dosen = Dosen.find_by(nip: current_user.username)
    @mahasiswa_bimbingan = AjukanTopik.where(nip: @dosen.nip)
    list_of_saved_rank = @mahasiswa_bimbingan.where.not(prioritas_dosen: nil)
    @rank_set = list_of_saved_rank.to_set

  end

  def save_rank
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    if(request.post?)
      nim = params[:nim]
      nip = params[:nip]
      topik = params[:topik]
      rank = params[:rank]

      list_rank = []
      all_record = AjukanTopik.where(nip: nip)
      for record in all_record
        list_rank.append(record.prioritas_dosen)
      end

      set_rank = list_rank.to_set

      if(set_rank.include?(rank))
        err_string = rank
      else
        ajukan_topik = AjukanTopik.find_by(nip: nip, nim: nim, topik: topik)
        debug = ajukan_topik.topik
        ajukan_topik.prioritas_dosen = rank
        ajukan_topik.save!
      end

      if(err_string)
        redirect_to "/dosen_pembimbing/mahasiswa_ajukan_topik" , alert: "Prioritas ke-"+err_string+" sudah terpakai"
      else
        redirect_to "/dosen_pembimbing/mahasiswa_ajukan_topik"
      end
    end
  end

  def reset_rank
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    if(request.post?)
      nim = params[:nim]
      nip = params[:nip]
      topik = params[:topik]

      ajukan_topik = AjukanTopik.find_by(nip: nip, nim: nim, topik: topik)
      ajukan_topik.prioritas_dosen = nil
      ajukan_topik.save!

      redirect_to "/dosen_pembimbing/mahasiswa_ajukan_topik"
    end
  end

  def bimbingan
    if (current_user!=nil)
      dosen = Dosen.find_by(nip: current_user.username)
      if(dosen.present?)
        if (dosen.dosenpembimbing != 'true')
          redirect_to "/dosens/pilih_role/"
        end
      else
        redirect_to "/dosens/pilih_role/"
      end
      @mahasiswa = []
      @assignment = Assignment.where('nip1 = ? or nip2 = ?', current_user.username, current_user.username)
      i = 0
      @assignment.each do |ass|
        @mahasiswa[i] = Mahasiswa.find_by(nim: ass.nim).name
        i = i + 1
      end
    else
      redirect_to "/"
    end
  end

  def bimbingan_ta2
    if (current_user!=nil)
      dosen = Dosen.find_by(nip: current_user.username)
      if(dosen.present?)
        if (dosen.dosenpembimbing != 'true')
          redirect_to "/dosens/pilih_role/"
        end
      else
        redirect_to "/dosens/pilih_role/"
      end
      @mahasiswa = []
      @assignment = Assignment.where('nip1 = ? or nip2 = ?', current_user.username, current_user.username)
      i = 0
      @assignment.each do |ass|
        current_mahasiswa = Mahasiswa.find_by(nim: ass.nim)
        if(current_mahasiswa != nil)
          @mahasiswa[i] = current_mahasiswa.name
        end
        i = i + 1
      end
    else
      redirect_to "/"
    end
  end

  def approve_bimbingan
    if (current_user!=nil)
      dosen = Dosen.find_by(nip: current_user.username)
      if(dosen.present?)
        if (dosen.dosenpembimbing != 'true')
          redirect_to "/dosens/pilih_role/"
        end
      else
        redirect_to "/dosens/pilih_role/"
      end
      id = params[:id]
      bim = Bimbingan.find_by(id: id)
      bim.approved = "DISETUJUI"
      bim.save
      respond_to do |format|
       msg = { :approval => bim.approved, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      redirect_to "/"
    end
  end

  def disapprove_bimbingan
    if (current_user!=nil)
      dosen = Dosen.find_by(nip: current_user.username)
      if(dosen.present?)
        if (dosen.dosenpembimbing != 'true')
          redirect_to "/dosens/pilih_role/"
        end
      else
        redirect_to "/dosens/pilih_role/"
      end
      id = params[:id]
      bim = Bimbingan.find_by(id: id)
      bim.approved = "TIDAK DISETUJUI"
      bim.save
      respond_to do |format|
       msg = { :approval => bim.approved, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      redirect_to "/"
    end
  end

  def lihat_bimbingan
    if (current_user!=nil)
      @id = params[:id]
      bim = Bimbingan.find_by(id: @id)
      if (bim.dosen_pembimbing != current_user.username)
        dosen = Dosen.find_by(nip: current_user.username)
        if(dosen.present?)
          if (dosen.dosenpembimbing != 'true')
            redirect_to "/dosens/pilih_role/"
          end
        else
          redirect_to "/dosens/pilih_role/"
        end
        @tanggal = bim.tanggal
        @nim = bim.mahasiswa
        @namamahasiswa = Mahasiswa.find_by(nim: @nim).name
        @hasil = bim.hasildiskusi
        @rencana = bim.rencanalanjut
        @rencanalanjut = bim.tanggalrencana
        @feedback = bim.feedback
        @approved = bim.approved
      else
        redirect_to "/dosen_pembimbing/dosen_nilai_seminar"
      end
    end
  end

  def edit_bimbingan
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    id = params[:id]
    mahasiswa = params[:mahasiswa]
    nim = mahasiswa.split("/").first
    namamahasiswa = mahasiswa.split("/").last
    @tanggal = params[:tanggal]
    @hasildiskusi = params[:hasildiskusi]
    @rencanalanjut = params[:rencanalanjut]
    @tanggalrencana = params[:tanggalrencana]
    @feedback = params[:feedback]
    bim = Bimbingan.find_by(id: id)
  	if (bim != nil)
  	  bim.hasildiskusi = @hasildiskusi
      bim.rencanalanjut = @rencanalanjut
      bim.tanggalrencana = @tanggalrencana
      if (@feedback != nil)
        bim.feedback = @feedback
      end
      bim.save
  	end

  	redirect_to controller: 'dosen_pembimbing', action: 'lihat_bimbingan', id: id

  end

  def fetch_data_bimbingan1
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @nim = params[:nim]
    @nip = params[:nip]
    @bimbingan = Bimbingan.where('mahasiswa = ? and dosen_pembimbing = ? and ta = ?', @nim, @nip, '1')
	  respond_to do |format|
     msg = { :bimbingan => @bimbingan, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def fetch_data_bimbingan2
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @nim = params[:nim]
    @nip = params[:nip]
    bimbingan = Bimbingan.where('(mahasiswa = ?) and (dosen_pembimbing = ?) and ta = ?', @nim, @nip, 2)
	  respond_to do |format|
     msg = { :bimbingan => bimbingan, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def show_bimbingan
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
    @dosbing = Dosen.find_by(nip: current_user.username)
    @idx_bimbingans = @dosbing.list_of_bimbingans
    @list_of_bimbingans = Array.new
    @idx_bimbingans.each do |elem|
      @bimbingan = Bimbingan.find_by(id: elem)
      if(@bimbingan)
        @list_of_bimbingans.push(@bimbingan)
      end
    end

    if @mahasiswa.present?
      render "/dosen_pembimbing/mahasiswa/show"
    else
      redirect_to "/dosen_pembimbing/mahasiswa/"
    end
  end

  # def approve_bimbingan
  #   dosen = Dosen.find_by(nip: current_user.username)
  #   if (dosen.dosenta == 'true')
  #     redirect_to "/dosens/pilih_role/"
  #   end
  #   nim = params[:nim]
  #   approved = params[:approved]
  #
  #   bim = Bimbingan.find_by(mahasiswa: nim)
  #   if(approved == "1")
  #     bim.approved = "approved"
  #   else
  #     bim.approved = "not_approved"
  #   end
  #   bim.save!
  #
  #   @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
  #   @dosbing = Dosen.find_by(nip: current_user.username)
  #   @idx_bimbingans = @dosbing.list_of_bimbingans
  #   @list_of_bimbingans = Array.new
  #   @idx_bimbingans.each do |elem|
  #     @bimbingan = Bimbingan.find_by(id: elem)
  #     if(@bimbingan)
  #       @list_of_bimbingans.push(@bimbingan)
  #     end
  #   end
  #
  #   if @mahasiswa.present?
  #     render "/dosen_pembimbing/mahasiswa/show"
  #   else
  #     redirect_to "/dosen_pembimbing/mahasiswa/"
  #   end
  # end

  def save_topik
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    #Post params
    @new_topic = params[:new_topic]
    @topic_category = params[:topic_category]

    #Don't save if either param is null
    if(@new_topic != "" && @topic_category != "")
      #Query identitas dosen
      #Harusnya berdasarkan Session Info
      @at = AjukanTopik.where('nip = ?', current_user.username)
      dosbing = Dosen.find_by(nip: current_user.username)
      if(@at != nil)
        invalid = false
        @at.each do |at|
          if (at.topik == @new_topic)
            invalid = true
          end
        end
        if (invalid == false)
          object = AjukanTopik.new(:topik => @new_topic, :kategori => @topic_category, :nip => current_user.username, :dosen => dosbing.nama, :availability => true)
       	  object.save
        end
      else
        object = AjukanTopik.new(:topik => @new_topic, :kategori => @topic_category, :nip => current_user.username, :dosen => dosbing.nama, :availability => true)
     	  object.save
      end

      #Push availability
      # @list_of_availability = @dosbing.topic_availability
      # @list_of_availability.push("1")
      # @dosbing.topic_availability = @list_of_availability

    end

    #Redirect back
    redirect_to controller: 'dosen_pembimbing', action: 'dosen_ajukan_topik', success: '1', topik: @new_topic, kategori: @topic_category
end

  def hapus_topik
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    #Post params
    @this_topic = params[:this_topic]

    #Query identitas dosen
    @at = AjukanTopik.where('nip = ? and topik = ?',current_user.username, @this_topic)
    if (@at != nil)
      @at.each do |at|
        at.destroy
      end
    end
    redirect_to controller: 'dosen_pembimbing', action: 'dosen_ajukan_topik', success: '3', topik: @this_topic
  end


  def dosen_ajukan_topik
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @kategoriList = Kategori.all
    @topikArray = []
    @a = AjukanTopik.where('nip = ?', current_user.username)
    if(@a != nil)
      i = 0
      @a.each do |at|
        if (@topikArray.include?(at.topik) == false)
          @topikArray[i] = at.topik
          i = i + 1
        end
      end
    end
  end

  def set_topic_availability
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
      redirect_to "/dosens/pilih_role/"
    end
    @this_topic = params[:this_topic]

    #Set availability
    @at = AjukanTopik.where('nip = ? and topik = ?', current_user.username, @this_topic)
    @at.each do |at|
      at.availability = !at.availability
      at.save
    end

    redirect_to '/dosen_pembimbing/dosen_ajukan_topik'
  end

  def dosen_nilai_seminar
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @mahasiswa_pembimbing = Seminar.where('nip_dosbing1 = ? or nip_dosbing2 = ?',current_user.username,current_user.username)
    @mahasiswa_penguji = Seminar.where('nip_dosji = ?',current_user.username)

  end

  def dosen_nilai_seminar_ta2
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @mahasiswa_pembimbing = Seminar2.where('nip_dosbing1 = ? or nip_dosbing2 = ?',current_user.username,current_user.username)
  end

  def fetch_nilai_seminar1
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
  	@nim = params[:nim]
    seminar = Seminar.find_or_initialize_by(nim: @nim)
    if (seminar == nil)
      respond_to do |format|
       msg = { :seminar => -1, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      respond_to do |format|
       msg = { :seminar => seminar, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    end
  end

  def fetch_nilai_seminar2
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
  	@nim = params[:nim]
    seminar = Seminar2.find_or_initialize_by(nim: @nim)

    if (seminar == nil)
      respond_to do |format|
       msg = { :seminar => -1, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      respond_to do |format|
       msg = { :seminar_ta2 => seminar, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    end
  end

  def fetch_nilai_sidang
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @nim = params[:nim]
    sidang = Sidang.find_or_initialize_by(nim: @nim)
    if (sidang == nil)
      respond_to do |format|
       msg = { :sidang => -1, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      if sidang.nip_dosji1 == current_user.username
        respond_to do |format|
         msg = { :sidang => sidang, :no => 1, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
         format.json  { render :json => msg } # don't do msg.to_json
        end
      else
        respond_to do |format|
         msg = { :sidang => sidang, :no => 2, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
         format.json  { render :json => msg } # don't do msg.to_json
        end
      end
    end
  end

  def input_berita_acara_sidang
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @nim = params[:nim]
    beritaacara = params[:beritaacara]
    sidang = Sidang.find_or_initialize_by(nim: @nim)
    if (sidang == nil)
      respond_to do |format|
       msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      sidang.berita_acara = beritaacara
      sidang.save
      respond_to do |format|
       msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    end
  end

  def input_berita_acara_seminar
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @nim = params[:nim]
    beritaacara = params[:beritaacara]
    seminar = Seminar.find_or_initialize_by(nim: @nim)
    if (seminar == nil)
      respond_to do |format|
       msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      seminar.berita_acara = beritaacara
      seminar.save
      respond_to do |format|
       msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    end
  end

  def input_berita_acara_seminar2
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @nim = params[:nim]
    beritaacara = params[:beritaacara]
    seminar2 = Seminar2.find_or_initialize_by(nim: @nim)
    if (seminar2 == nil)
      respond_to do |format|
       msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    else
      seminar2.berita_acara = beritaacara
      seminar2.save
      respond_to do |format|
       msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
       format.json  { render :json => msg } # don't do msg.to_json
      end
    end
  end

  def edit_nilai_seminar
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end

    @status = params[:status_mahasiswa_penguji]
    if (@status == 'penguji')
      @nim = params[:nim_mahasiswa_penguji]
      seminar = Seminar.find_or_initialize_by(nim: @nim)
      @nilai_seminar1 = params[:nilai_seminar1]
      @nilai_seminar2 = params[:nilai_seminar2]
      @nilai_seminar3 = params[:nilai_seminar3]
      @nilai_seminar3a = params[:nilai_seminar3a]
      @nilai_seminar3b = params[:nilai_seminar3b]
      @nilai_seminar3c = params[:nilai_seminar3c]
      @nilai_seminar4 = params[:nilai_seminar4]
      @nilai_seminar4a = params[:nilai_seminar4a]
      @nilai_seminar4b = params[:nilai_seminar4b]
      @nilai_seminar4c = params[:nilai_seminar4c]
      @nilai_seminar4d = params[:nilai_seminar4d]
      @nilai_seminar4e = params[:nilai_seminar4e]
      @nilai_seminar5 = params[:nilai_seminar5]
      @nilai_seminar6 = params[:nilai_seminar6]
      @nilai_total = params[:nilai_total]
      seminar.nilai_seminar1_penguji = @nilai_seminar1
      seminar.nilai_seminar2_penguji = @nilai_seminar2
      seminar.nilai_seminar3_penguji = @nilai_seminar3
      seminar.nilai_seminar3a_penguji = @nilai_seminar3a
      seminar.nilai_seminar3b_penguji = @nilai_seminar3b
      seminar.nilai_seminar3c_penguji = @nilai_seminar3c
      seminar.nilai_seminar4_penguji = @nilai_seminar4
      seminar.nilai_seminar4a_penguji = @nilai_seminar4a
      seminar.nilai_seminar4b_penguji = @nilai_seminar4b
      seminar.nilai_seminar4c_penguji = @nilai_seminar4c
      seminar.nilai_seminar4d_penguji = @nilai_seminar4d
      seminar.nilai_seminar4e_penguji = @nilai_seminar4e
      seminar.nilai_seminar5_penguji = @nilai_seminar5
      seminar.nilai_seminar6_penguji = @nilai_seminar6
      seminar.nilai_total_penguji = @nilai_total
      seminar.save
    else
      @nim = params[:nim_mahasiswa_pembimbing]
  	  seminar = Seminar.find_or_initialize_by(nim: @nim)
      @nilai_seminar1 = params[:pembimbing_nilai_seminar1]
      @nilai_seminar2 = params[:pembimbing_nilai_seminar2]
      @nilai_seminar3 = params[:pembimbing_nilai_seminar3]
      @nilai_seminar3a = params[:pembimbing_nilai_seminar3a]
      @nilai_seminar3b = params[:pembimbing_nilai_seminar3b]
      @nilai_seminar3c = params[:pembimbing_nilai_seminar3c]
      @nilai_seminar4 = params[:pembimbing_nilai_seminar4]
      @nilai_seminar4a = params[:pembimbing_nilai_seminar4a]
      @nilai_seminar4b = params[:pembimbing_nilai_seminar4b]
      @nilai_seminar4c = params[:pembimbing_nilai_seminar4c]
      @nilai_seminar4d = params[:pembimbing_nilai_seminar4d]
      @nilai_seminar4e = params[:pembimbing_nilai_seminar4e]
      @nilai_seminar5 = params[:pembimbing_nilai_seminar5]
      @nilai_seminar6 = params[:pembimbing_nilai_seminar6]
      @nilai_total = params[:pembimbing_nilai_total]
      seminar.nilai_seminar1_pembimbing = @nilai_seminar1
      seminar.nilai_seminar2_pembimbing = @nilai_seminar2
      seminar.nilai_seminar3_pembimbing = @nilai_seminar3
      seminar.nilai_seminar4_pembimbing = @nilai_seminar4
      seminar.nilai_seminar4a_pembimbing = @nilai_seminar4a
      seminar.nilai_seminar4b_pembimbing = @nilai_seminar4b
      seminar.nilai_seminar4c_pembimbing = @nilai_seminar4c
      seminar.nilai_seminar5_pembimbing = @nilai_seminar5
      seminar.nilai_seminar6_pembimbing = @nilai_seminar6
      seminar.nilai_total_pembimbing = @nilai_total
      seminar.save
    end

    redirect_to '/dosen_pembimbing/dosen_nilai_seminar'
  end

  def edit_nilai_sidang
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
      redirect_to "/dosens/pilih_role/"
    end
    @status = params[:status_mahasiswa_penguji]
    if (@status == 'penguji')
      @nim = params[:nim_mahasiswa_penguji]
  	  sidang = Sidang.find_or_initialize_by(nim: @nim)
      if sidang.nip_dosji1 == current_user.username
        @nilai_sidang1 = params[:nilai_sidang1]
        @nilai_sidang2 = params[:nilai_sidang2]
        @nilai_sidang3 = params[:nilai_sidang3]
        @nilai_sidang4 = params[:nilai_sidang4]
        @nilai_sidang5 = params[:nilai_sidang5]
        @nilai_sidang6 = params[:nilai_sidang6]
        @nilai_total = params[:nilai_total]
        sidang.nilai_sidang1_penguji1 = @nilai_sidang1
        sidang.nilai_sidang2_penguji1 = @nilai_sidang2
        sidang.nilai_sidang3_penguji1 = @nilai_sidang3
        sidang.nilai_sidang4_penguji1 = @nilai_sidang4
        sidang.nilai_sidang5_penguji1 = @nilai_sidang5
        sidang.nilai_sidang6_penguji1 = @nilai_sidang6
        sidang.nilai_total_penguji1 = @nilai_total
        sidang.save
      else
        @nilai_sidang1 = params[:nilai_sidang1]
        @nilai_sidang2 = params[:nilai_sidang2]
        @nilai_sidang3 = params[:nilai_sidang3]
        @nilai_sidang4 = params[:nilai_sidang4]
        @nilai_sidang5 = params[:nilai_sidang5]
        @nilai_sidang6 = params[:nilai_sidang6]
        @nilai_total = params[:nilai_total]
        sidang.nilai_sidang1_penguji2 = @nilai_sidang1
        sidang.nilai_sidang2_penguji2 = @nilai_sidang2
        sidang.nilai_sidang3_penguji2 = @nilai_sidang3
        sidang.nilai_sidang4_penguji2 = @nilai_sidang4
        sidang.nilai_sidang5_penguji2 = @nilai_sidang5
        sidang.nilai_sidang6_penguji2 = @nilai_sidang6
        sidang.nilai_total_penguji2 = @nilai_total
        sidang.save
      end
    else
      @nim = params[:nim_mahasiswa_pembimbing]
  	  sidang = Sidang.find_or_initialize_by(nim: @nim)
      @nilai_sidang1 = params[:pembimbing_nilai_sidang1]
      @nilai_sidang2 = params[:pembimbing_nilai_sidang2]
      @nilai_sidang3 = params[:pembimbing_nilai_sidang3]
      @nilai_sidang4 = params[:pembimbing_nilai_sidang4]
      @nilai_sidang5 = params[:pembimbing_nilai_sidang5]
      @nilai_sidang6 = params[:pembimbing_nilai_sidang6]
      @nilai_total = params[:pembimbing_nilai_total]
      sidang.nilai_sidang1_pembimbing = @nilai_sidang1
      sidang.nilai_sidang2_pembimbing = @nilai_sidang2
      sidang.nilai_sidang3_pembimbing = @nilai_sidang3
      sidang.nilai_sidang4_pembimbing = @nilai_sidang4
      sidang.nilai_sidang5_pembimbing = @nilai_sidang5
      sidang.nilai_sidang6_pembimbing = @nilai_sidang6
      sidang.nilai_total_pembimbing = @nilai_total
      sidang.save
    end

    redirect_to '/dosen_pembimbing/dosen_nilai_sidang'
  end

  def edit_nilai_seminar_ta2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
      redirect_to "/dosens/pilih_role/"
    end
    @nim = params[:nim_mahasiswa_pembimbing]
	  seminar_ta2 = Seminar2.find_or_initialize_by(nim: @nim)
    @nilai_seminar_ta21 = params[:pembimbing_nilai_seminar_ta21]
    @nilai_seminar_ta22 = params[:pembimbing_nilai_seminar_ta22]
    @nilai_seminar_ta23 = params[:pembimbing_nilai_seminar_ta23]
    @nilai_seminar_ta24 = params[:pembimbing_nilai_seminar_ta24]
    @nilai_seminar_ta25 = params[:pembimbing_nilai_seminar_ta25]
    @nilai_seminar_ta26 = params[:pembimbing_nilai_seminar_ta26]
    @nilai_seminar_ta27 = params[:pembimbing_nilai_seminar_ta27]
    @nilai_total = params[:pembimbing_nilai_total]
    seminar_ta2.nilai_seminar_ta21_pembimbing = @nilai_seminar_ta21
    seminar_ta2.nilai_seminar_ta22_pembimbing = @nilai_seminar_ta22
    seminar_ta2.nilai_seminar_ta23_pembimbing = @nilai_seminar_ta23
    seminar_ta2.nilai_seminar_ta24_pembimbing = @nilai_seminar_ta24
    seminar_ta2.nilai_seminar_ta25_pembimbing = @nilai_seminar_ta25
    seminar_ta2.nilai_seminar_ta26_pembimbing = @nilai_seminar_ta26
    seminar_ta2.nilai_seminar_ta27_pembimbing = @nilai_seminar_ta27
    seminar_ta2.nilai_total_pembimbing = @nilai_total
    seminar_ta2.save

    redirect_to '/dosen_pembimbing/dosen_nilai_seminar_ta2'
  end

  def dosen_nilai_sidang
    dosen = Dosen.find_by(nip: current_user.username)
    if(dosen.present?)
      if (dosen.dosenpembimbing != 'true' and dosen.dosenpenguji != 'true')
        redirect_to "/dosens/pilih_role/"
      end
    else
      redirect_to "/dosens/pilih_role/"
    end
    @mahasiswa_pembimbing = Sidang.where('nip_dosbing1 = ? or nip_dosbing2 = ?',current_user.username,current_user.username)
    @mahasiswa_penguji = Sidang.where('nip_dosji1 = ? or nip_dosji2 = ?',current_user.username, current_user.username)

  end
end
