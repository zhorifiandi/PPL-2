class MahasiswaController < ApplicationController
  def mahasiswa_belum_dapat_bimbingan
  end

  def mahasiswa_belum_dapat_bimbingan_ta2
  end



  def edit_hasil_bimbingan
    if logged_in?
      @id = params[:id]
      bim = Bimbingan.find_by(id: @id)
      @tanggal = bim.tanggal
      @nipdosen = bim.dosen_pembimbing
      @namadosen = Dosen.find_by(nip: @nipdosen).nama
      @hasil = bim.hasildiskusi
      @rencana = bim.rencanalanjut
      @rencanalanjut = bim.tanggalrencana
      @feedback = bim.feedback
      @approved = bim.approved
    end
  end

  def edit_hasil_bimbingan_ta2
    if logged_in?
      @id = params[:id]
      bim = Bimbingan.find_by(id: @id)
      @tanggal = bim.tanggal
      @nipdosen = bim.dosen_pembimbing
      @namadosen = Dosen.find_by(nip: @nipdosen).nama
      @hasil = bim.hasildiskusi
      @rencana = bim.rencanalanjut
      @rencanalanjut = bim.tanggalrencana
      @feedback = bim.feedback
      @approved = bim.approved
    end
  end

  def edit_bimbingan
    dosenbing = params[:dosen_pembimbing]
    nipdosen = dosenbing.split("/").first
    namadosen = dosenbing.split("/").last
    @tanggal = params[:tanggal]
    @hasildiskusi = params[:hasildiskusi]
    @rencanalanjut = params[:rencanalanjut]
    @tanggalrencana = params[:tanggalrencana]
    @mahasiswa = current_user.username
    @id = params[:id]
    bim = Bimbingan.find_by(id: params[:id])
  	if (bim != nil)
  	  bim.dosen_pembimbing = nipdosen
      bim.hasildiskusi = @hasildiskusi
      bim.rencanalanjut = @rencanalanjut
      bim.tanggalrencana = @tanggalrencana
      bim.approved = "BELUM DIBERI PERSETUJUAN"
      bim.save
  	end

  	redirect_to controller: 'mahasiswa', action: 'edit_hasil_bimbingan', id: @id

  end

  def edit_bimbingan_ta2
    dosenbing = params[:dosen_pembimbing]
    nipdosen = dosenbing.split("/").first
    namadosen = dosenbing.split("/").last
    @tanggal = params[:tanggal]
    @hasildiskusi = params[:hasildiskusi]
    @rencanalanjut = params[:rencanalanjut]
    @tanggalrencana = params[:tanggalrencana]
    @mahasiswa = current_user.username

    @id = params[:id]
    bim = Bimbingan.find_by(id: params[:id])
  	if (bim != nil)
  	  bim.dosen_pembimbing = nipdosen
      bim.hasildiskusi = @hasildiskusi
      bim.rencanalanjut = @rencanalanjut
      bim.tanggalrencana = @tanggalrencana
      bim.approved = "BELUM DIBERI PERSETUJUAN"
      bim.save
  	end

  	redirect_to controller: 'mahasiswa', action: 'edit_hasil_bimbingan_ta2', id: @id

  end

  def mahasiswa_ajukan_topik
    #Retrieve list of dosen_pembimbing
	  @dosbingList = Dosen.all

    #Retrieve list of kategori
    @kategoriList = Kategori.all

    # Retrieve assignment
    @assignment = Assignment.find_by(nim: current_user.username)

    #Retrieve list of topic based on value selected
    #@kategoriList =
    if logged_in?
      if current_user.role == 'mahasiswa'
        mhs = AjukanTopik.find_by(nim: current_user.username)

        if(mhs != nil)
          #redirect_to'/mahasiswa/save_topik'
          redirect_to controller: 'mahasiswa', action: 'daftar_pengajuan_topik'
        else
          #redirect_to '/mahasiswa/mahasiswa_ajukan_topik'
          render '/mahasiswa/mahasiswa_ajukan_topik'
        end
      end
    end
  end

  def daftar_pengajuan_topik
    @ajukantopik = AjukanTopik.where("nim = ?", current_user.username)
    @assignment = Assignment.where("nim = ?", current_user.username)
  end

  def delete_topik
    AjukanTopik.destroy_all(["nim = ?", current_user.username])
  	redirect_to controller: 'mahasiswa', action: 'mahasiswa_ajukan_topik'
  end

  def save_topik
    if logged_in?
      if current_user.role == 'mahasiswa'
        mhs = AjukanTopik.find_by(nim: current_user.username)

        if(mhs != nil)
          #redirect_to'/mahasiswa/save_topik'
          redirect_to controller: 'mahasiswa', action: 'daftar_pengajuan_topik'
        end
      end
    end
    nim = current_user.username
    mhs = Mahasiswa.find_by(nim: nim)
    nama = mhs.name
    ot1 = params["options-topik1"]
    ot2 = params["options-topik2"]
    ot3 = params["options-topik3"]
    it1 = params["input-topik1"]
    it2 = params["input-topik2"]
    it3 = params["input-topik3"]
    dosen1 = params["options-dosen1"]
    nipdosen1 = dosen1.split("/").first
    namadosen1 = dosen1.split("/").last
    dosen2 = params["options-dosen2"]
    nipdosen2 = dosen2.split("/").first
    namadosen2 = dosen2.split("/").last
    dosen3 = params["options-dosen3"]
    nipdosen3 = dosen3.split("/").first
    namadosen3 = dosen3.split("/").last
    kategori1 = params["options-kategori1"]
    kategori2 = params["options-kategori2"]
    kategori3 = params["options-kategori3"]

    counter = 0
    #Add to Dosbing Table

    if (params[:topik1] == 'topikSendiri1')
      object1 = AjukanTopik.new(:mahasiswa => nama, :nim => nim, :topik => it1, :kategori => kategori1, :nip => nipdosen1, dosen: namadosen1, prioritas_mahasiswa: '1', availability: true)
   	  object1.save
    elsif (params[:topik1] == 'topikDosen1')
      object1 = AjukanTopik.new(:mahasiswa => nama, :nim => nim, :topik => ot1, :kategori => kategori1, :nip => nipdosen1, dosen: namadosen1, prioritas_mahasiswa: '1', availability: true)
      object1.save
    else
      counter += 1
    end


    if (params[:topik2] == 'topikSendiri2')
      object2 = AjukanTopik.new(:mahasiswa => nama, :nim => nim, :topik => it2, kategori: kategori2, nip: nipdosen2, dosen: namadosen2, prioritas_mahasiswa: (2-counter).to_s, availability: true)
   	  object2.save
    elsif (params[:topik2] == 'topikDosen2')
      object2 = AjukanTopik.new(:mahasiswa => nama, :nim => nim, :topik => ot2, :kategori => kategori2, nip: nipdosen2, dosen: namadosen2, prioritas_mahasiswa: (2-counter).to_s, availability: true)
   	  object2.save
    else
      counter += 1
    end


    if (params[:topik3] == 'topikSendiri3')
      object3 = AjukanTopik.new(:mahasiswa => nama, :nim => nim, :topik => it3, kategori: kategori3, nip: nipdosen3, dosen: namadosen3, prioritas_mahasiswa: (3-counter).to_s, availability: true)
   	  object3.save
    elsif (params[:topik3] == 'topikDosen3')
      object3 = AjukanTopik.new(:mahasiswa => nama, :nim => nim, :topik => ot3, kategori: kategori3, nip: nipdosen3, dosen: namadosen3, prioritas_mahasiswa: (3-counter).to_s, availability: true)
   	  object3.save
    end

    redirect_to controller: 'mahasiswa', action: 'mahasiswa_ajukan_topik'
  end

  def bimbingan
    if logged_in?
      ass = Assignment.find_by(nim: current_user.username)
      if (ass != nil)
        @bimbingan = Bimbingan.where("mahasiswa = ? AND ta = ?", current_user.username, 1)
      else
        redirect_to controller: 'mahasiswa', action: 'mahasiswa_belum_dapat_bimbingan'
      end
    end
  end

  def bimbingan_ta2
    if logged_in?
      ass = Assignment.find_by(nim: current_user.username)
      if (ass != nil)
        @bimbingan = Bimbingan.where("mahasiswa = ? AND ta = ?", current_user.username, 2)
      else
        redirect_to controller: 'mahasiswa', action: 'mahasiswa_belum_dapat_bimbingan_ta2'
      end
    end
  end

  def fetch_topik_dosen
    dosbing = params[:dosbing]
    kategori = params[:kategori]
    nip = dosbing.split(" ")[0]
    available = true

    topik = AjukanTopik.where('nip = ? and kategori = ? and availability = ?', nip, kategori, available)
    topic_filtered = Array.new()

    topik.each do |at|
      if (topic_filtered.include?(at.topik) == false)
        topic_filtered.push(at.topik)
      end
    end

    respond_to do |format|
     msg = { :arr_topic => topic_filtered, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def deep_hash_keys(h)
    h.keys + h.map { |_, v| v.is_a?(Hash) ? deep_hash_keys(v) : nil }.flatten.compact
  end

  def ajukan_bimbingan
    ass = Assignment.find_by(nim: current_user.username)
    if (ass == nil)
      redirect_to controller: 'mahasiswa', action: 'mahasiswa_belum_dapat_bimbingan'
    else
      @nipdosen1 = ass.nip1
      @namadosen1 = Dosen.find_by(nip: @nipdosen1).nama
      if (ass.nip2 != nil)
        @nipdosen2 = ass.nip2
        @namadosen2 = Dosen.find_by(nip: @nipdosen2).nama
      end
    end
  end

  def ajukan_bimbingan_ta2
    ass = Assignment.find_by(nim: current_user.username)
    if (ass == nil)
      redirect_to controller: 'mahasiswa', action: 'mahasiswa_belum_dapat_bimbingan_ta2'
    else
      @nipdosen1 = ass.nip1
      @namadosen1 = Dosen.find_by(nip: @nipdosen1).nama
      if (ass.nip2 != nil)
        @nipdosen2 = ass.nip2
        @namadosen2 = Dosen.find_by(nip: @nipdosen2).nama
      end
    end
  end

  def save_bimbingan
  	#Post params
    if logged_in?
      dosenbing = params[:dosen_pembimbing]
      nipdosen = dosenbing.split("/").first
      namadosen = dosenbing.split("/").last
      @tanggal = params[:tanggal]
      @hasildiskusi = params[:hasildiskusi]
      @rencanalanjut = params[:rencanalanjut]
      @tanggalrencana = params[:tanggalrencana]
      @mahasiswa = current_user.username
      @approved = "BELUM DIBERI PERSETUJUAN"

  	  #Save
    	 @bimbingan = Bimbingan.new
    	 @bimbingan.dosen_pembimbing = nipdosen
    	 @bimbingan.tanggal = @tanggal
    	 @bimbingan.hasildiskusi =@hasildiskusi
    	 @bimbingan.rencanalanjut = @rencanalanjut
    	 @bimbingan.tanggalrencana = @tanggalrencana
    	 @bimbingan.mahasiswa = @mahasiswa
       @bimbingan.approved = @approved
       @bimbingan.ta = 1
    	 @bimbingan.save!
    end

	 #Query identitas dosen
     #@dosbing = Dosen.find_or_initialize_by(name: @dosbing)
     #Push Bimbingan
     #@list_of_bimbingans = @dosbing.list_of_bimbingans
     #@list_of_bimbingans.push(@bimbingan.id)
     #@dosbing.list_of_bimbingans = @list_of_bimbingans
     #@dosbing.save!

     # #Query identitas mahasiswa
     #@mhsw = Mahasiswa.find_or_initialize_by(name: @mahasiswa)
     ##Push Bimbingan
     #@list_of_bimbingans = @mhsw.list_of_bimbingans
     #@list_of_bimbingans.push(@bimbingan.id)
     #@mhsw.list_of_bimbingans = @list_of_bimbingans
     #@mhsw.save!

  	redirect_to controller:'mahasiswa', action:'bimbingan'
  end

  def save_bimbingan_ta2
  	#Post params
    if logged_in?
      dosenbing = params[:dosen_pembimbing]
      nipdosen = dosenbing.split("/").first
      namadosen = dosenbing.split("/").last
      @tanggal = params[:tanggal]
      @hasildiskusi = params[:hasildiskusi]
      @rencanalanjut = params[:rencanalanjut]
      @tanggalrencana = params[:tanggalrencana]
      @mahasiswa = current_user.username
      @approved = "BELUM DIBERI PERSETUJUAN"

  	  #Save
    	 @bimbingan = Bimbingan.new
    	 @bimbingan.dosen_pembimbing = nipdosen
    	 @bimbingan.tanggal = @tanggal
    	 @bimbingan.hasildiskusi =@hasildiskusi
    	 @bimbingan.rencanalanjut = @rencanalanjut
    	 @bimbingan.tanggalrencana = @tanggalrencana
    	 @bimbingan.mahasiswa = @mahasiswa
       @bimbingan.approved = @approved
       @bimbingan.ta = 2
    	 @bimbingan.save!
    end

	 #Query identitas dosen
     #@dosbing = Dosen.find_or_initialize_by(name: @dosbing)
     #Push Bimbingan
     #@list_of_bimbingans = @dosbing.list_of_bimbingans
     #@list_of_bimbingans.push(@bimbingan.id)
     #@dosbing.list_of_bimbingans = @list_of_bimbingans
     #@dosbing.save!

     # #Query identitas mahasiswa
     #@mhsw = Mahasiswa.find_or_initialize_by(name: @mahasiswa)
     ##Push Bimbingan
     #@list_of_bimbingans = @mhsw.list_of_bimbingans
     #@list_of_bimbingans.push(@bimbingan.id)
     #@mhsw.list_of_bimbingans = @list_of_bimbingans
     #@mhsw.save!

  	redirect_to controller:'mahasiswa', action:'bimbingan_ta2'
  end

  def status_mahasiswa
    @mahasiswa = Mahasiswa.find_by(nim: current_user.username)
    @assignment = Assignment.find_by(nim: current_user.username)
    @bimbingan = Bimbingan.where('mahasiswa = ? and ta = ? and approved = ?', current_user.username,1,"DISETUJUI").length
    @seminar = Seminar.find_by(nim: current_user.username)
  end

  def status_mahasiswa_ta2
    @mahasiswa = Mahasiswa.find_by(nim: current_user.username)
    @assignment = Assignment.find_by(nim: current_user.username)
    @bimbingan = Bimbingan.where('mahasiswa = ? and ta = ? and approved = ?', current_user.username,2,"DISETUJUI").length
    @seminar = Seminar2.find_by(nim: current_user.username)
    @sidang = Sidang.find_by(nim: current_user.username)
  end
end
