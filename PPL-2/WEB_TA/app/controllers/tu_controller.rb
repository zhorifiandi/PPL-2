class TuController < ApplicationController
  def tu_daftar_user
  end

  def tu_assign_topik
  	@dosen = DosenPembimbing.all
  end

  def input_jadwal_seminar_TAI
    if(request.post?)
      nim = params[:nim]
      tanggal = params["tanggal"]
      nip = Assignment.find_by(nim: nim).nip1

      seminar = Seminar.find_by(nim: nim)

      if(seminar.blank?)
        seminar = Seminar.new
        seminar.nim = nim
        seminar.nama_mhs = Mahasiswa.find_by(nim: nim).name
        seminar.nip_dosbing = nip
        seminar.nama_dosbing = Dosen.find_by(nip: nip).nama
        seminar.topik = Assignment.find_by(nim: nim).judul_topik
        seminar.kategori = Assignment.find_by(nim: nim).kategori_topik
        seminar.semester = "I"
        # seminar.tahun_ajaran = tahun + "/" + tahun_selanjutnya_int.to_s
        seminar.tahun_ajaran = "2016/2017"
      end


      seminar.jadwal = tanggal
      seminar.save!

      @mahasiswa = Mahasiswa.find_by(nim: nim)
      redirect_to "/tu/mahasiswa/" + nim
    end
  end

  def input_jadwal_seminar_TAII
    if(request.post?)
      nim = params[:nim]
      tanggal = params["tanggal-seminar1"]
      bulan = params["bulan-seminar1"]
      tahun = params["tahun-seminar1"]
      nip = Assignment.find_by(nim: nim).nip
      tahun_selanjutnya_int = tahun.to_i + 1

      seminar = Seminar2.find_by(nim: nim)

      if(seminar.blank?)
        seminar = Seminar2.new
        seminar.nim = nim
        seminar.nama_mhs = Mahasiswa.find_by(nim: nim).name
        seminar.nip_dosbing = nip
        seminar.nama_dosbing = Dosen.find_by(nip: nip).nama
        seminar.topik = Assignment.find_by(nim: nim).judul_topik
        seminar.kategori = Assignment.find_by(nim: nim).kategori_topik
        seminar.semester = "II"
        # seminar.tahun_ajaran = tahun + "/" + tahun_selanjutnya_int.to_s
        seminar.tahun_ajaran = "2016/2017"
      end

      if(tanggal.length == 1)
        tanggal = '0' + tanggal
      end
      if(bulan.length == 1)
        bulan = '0' + bulan
      end

      seminar.jadwal = tanggal + '-' + bulan + '-' + tahun
      seminar.save!

      @mahasiswa = Mahasiswa.find_by(nim: nim)
      redirect_to "/tu/mahasiswa_TAII/" + nim
    end
  end

  def input_jadwal_sidang_TAII
    if(request.post?)
      nim = params[:nim]
      tanggal = params["tanggal-sidang2"]
      bulan = params["bulan-sidang2"]
      tahun = params["tahun-sidang2"]
      nip = Assignment.find_by(nim: nim).nip
      tahun_selanjutnya_int = tahun.to_i + 1

      seminar = Sidang.find_by(nim: nim)

      if(seminar.blank?)
        seminar = Sidang.new
        seminar.nim = nim
        seminar.nama_mhs = Mahasiswa.find_by(nim: nim).name
        seminar.nip_dosbing = nip
        seminar.nama_dosbing = Dosen.find_by(nip: nip).nama
        seminar.topik = Assignment.find_by(nim: nim).judul_topik
        seminar.kategori = Assignment.find_by(nim: nim).kategori_topik
        seminar.semester = "II"
        # seminar.tahun_ajaran = tahun + "/" + tahun_selanjutnya_int.to_s
        seminar.tahun_ajaran = "2016/2017"
      end

      if(tanggal.length == 1)
        tanggal = '0' + tanggal
      end
      if(bulan.length == 1)
        bulan = '0' + bulan
      end

      seminar.jadwal = tanggal + '-' + bulan + '-' + tahun
      seminar.save!

      @mahasiswa = Mahasiswa.find_by(nim: nim)
      redirect_to "/tu/mahasiswa_TAII/" + nim
    end
  end

  def input_nilai_hadir_TAI
    if(request.post?)
      nim = params[:nim]
      nilai = params["nilai-seminar1"]
      hadir = params["kehadiran-seminar1"]

      nilaiAkhir = NilaiAkhir.find_by(nim: nim)

      nilaiAkhir.nilai_tugas = nilai
      nilaiAkhir.jumlah_presensi = hadir
      nilaiAkhir.save!

      @mahasiswa = Mahasiswa.find_by(nim: nim)
      redirect_to "/tu/mahasiswa/" + nim
    end
  end

  def input_nilai_hadir_TAII
    if(request.post?)
      nim = params[:nim]
      nilai = params["nilai-2"]
      hadir = params["kehadiran-2"]

      nilaiAkhir = NilaiAkhir2.find_by(nim: nim)

      nilaiAkhir.nilai_tugas = nilai
      nilaiAkhir.jumlah_presensi = hadir
      nilaiAkhir.save!

      @mahasiswa = Mahasiswa.find_by(nim: nim)
      redirect_to "/tu/mahasiswa_TAII/" + nim
    end
  end

  def input_persyaratan_final_TAII
    if(request.post?)
      nim = params[:nim]
      laporan = params["laporan_ta"]
      abstrak = params["abstrak_ta"]
      makalah = params["makalah"]
      poster = params["poster"]
      program = params["program"]

      status = Seminarsidang.find_by(nim: nim)

      if(laporan != nil)
        status.laporan_ta = true
      else
        status.laporan_ta = false
      end

      if(abstrak != nil)
        status.abstrak_ta = true
      else
        status.abstrak_ta = false
      end

      if(makalah != nil)
        status.makalah = true
      else
        status.makalah = false
      end

      if(poster != nil)
        status.poster = true
      else
        status.poster = false
      end

      if(program != nil)
        status.program = true
      else
        status.program = false
      end

      status.save!

      @mahasiswa = Mahasiswa.find_by(nim: nim)
      redirect_to "/tu/mahasiswa_TAII/" + nim
    end
  end

  def add_mahasiswa
  	nama = params[:nama]
  	@nim = params[:nim]
  	password = params[:password]
  	check1 = Mahasiswa.find_by(nim: @nim)
    check2 = User.
    find_by(username: @nim)
  	if (check1 != nil || check2 != nil)
  	  redirect_to controller: 'tu', action: 'tu_daftar_user', success: '0'
  	else

      #Add to Mahasiswa Table
      object = Mahasiswa.new(:name => nama, :nim => @nim, :list_of_nilai_seminar => Mahasiswa.list_of_nilai_seminar_constant_1, :list_of_nilai_sidang => Mahasiswa.list_of_nilai_sidang_constant_1)
      object.save

      #Add to User Table
      usr = User.new(:username => @nim, :password => password, :role => "mahasiswa", :id_on_role => object.id)
      usr.save


      redirect_to controller: 'tu', action: 'tu_daftar_user', success: '1'
    end
  end

  def add_dosen
  	nama = params[:nama]
  	@nip = params[:nip]
  	lab = params[:lab]
  	password = params[:password]
  	check1 = DosenPembimbing.find_by(nip: @nip)
    check2 = User.find_by(username: @nip)
  	if (check1 != nil || check2 != nil)
  	  redirect_to controller: 'tu', action: 'tu_daftar_user', success: '0'
  	else
        #Add to Dosbing Table
        object = DosenPembimbing.new(:name => nama, :nip => @nip, :lab => lab, :list_of_topic => DosenPembimbing.list_of_topic_constant_1, :topic_category => DosenPembimbing.list_of_category_constant_1, :topic_availability => DosenPembimbing.list_of_availability_constant_1)
     	  object.save

        #Add to User Table
        usr = User.new(:username => @nip, :password => password, :role => "dosen", :id_on_role => object.id)
        usr.save
    	  redirect_to controller: 'tu', action: 'tu_daftar_user', success: '1'
  	end
  end

  def fetch_topik
  	@nip = params[:nip]
    @temptopik = AjukanTopik.where("nip = "+ @nip)
    @topik = @temptopik.where("prioritas_dosen > 0")
    @jumlah = @topik.count

    respond_to do |format|
     msg = { :topik => @topik, :jumlah => @jumlah, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def do_assign
  	@nip = params[:nip]
  	@nim = params[:input_nim]
  	@topik = params[:topik]
  	@kategori = params[:kategori]

  	AjukanTopik.where(:nim => @nim).destroy_all
  	object = Assignment.new(:nip => @nip, :nim => @nim, :judul_topik => @topik, :kategori_topik => @kategori, :nomor_sk => 'tbd')
   	object.save
  	redirect_to controller: 'tu', action: 'tu_assign_topik', success: '1'

  end

  def tu_lihat_user
  	@search = params[:search]
  	if (@search == nil)
  	  @mahasiswa = Mahasiswa.all
  	  @dosen = DosenPembimbing.all
      @tu = Tu.all
  	else
  	  @mahasiswa = Mahasiswa.where('nim LIKE ?', "%#{@search}%").or(Mahasiswa.where('name LIKE ?', "%#{@search}%"))
  	  @dosen = DosenPembimbing.where('nip LIKE ?', "%#{@search}%").or(DosenPembimbing.where('name LIKE ?', "%#{@search}%")).or(DosenPembimbing.where('lab LIKE ?', "%#{@search}%"))
      # Haven't implemented
      # @tu
    end
  end

  def fetch_data_mahasiswa
  	@mahasiswa = Mahasiswa.find_by(nim: params[:nim])
  	@bimbingan = Assignment.find_by(nim: params[:nim])
  	if (@bimbingan != nil)
  	  @dosen = DosenPembimbing.find_by(nip: @bimbingan.nip)
  	end
  	respond_to do |format|
     msg = { :mahasiswa => @mahasiswa, :bimbingan => @bimbingan, :dosen => @dosen, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def fetch_data_dosen
  	@dosen = DosenPembimbing.find_by(nip: params[:nip])

  	respond_to do |format|
     msg = { :dosen => @dosen, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def edit_mahasiswa
  	mahasiswa = Mahasiswa.find_by(nim: params[:oldNim])
  	assignment = Assignment.find_by(nim: params[:oldNim])
  	topik = AjukanTopik.find_by(nim: params[:oldNim])
  	bimbingan = Bimbingan.find_by(mahasiswa: mahasiswa.name)
    user = User.find_by(username: params[:oldNipDosen])

  	mahasiswa.nim = params[:nim]
  	mahasiswa.name = params[:nama]
  	if (assignment != nil)
  	  assignment.nim = params[:nim]
  	  assignment.nip = params[:nip]
  	  assignment.judul_topik = params[:topik]
  	  assignment.kategori_topik = params[:kategori]
  	end
  	if (topik != nil)
  	  topik.nim = params[:nim]
  	  topik.mahasiswa = params[:nama]
  	  topik.nip = params[:nip]
  	  topik.dosen = params[:dosen]
  	  topik.topik = params[:topik]
  	  topik.kategori = params[:kategori]
  	end
  	if (bimbingan != nil)
  	  bimbingan.mahasiswa = params[:nama]
  	end

    user.nim = params[:nim]
    user.save

  	mahasiswa.save
  	assignment.save
  	topik.save
  	bimbingan.save

  	redirect_to controller: 'tu', action: 'tu_lihat_user', success: '1'

  end

  def edit_dosen
  	dosen = DosenPembimbing.find_by(nip: params[:oldNipDosen])
  	assignment = Assignment.find_by(nip: params[:oldNipDosen])
  	topik = AjukanTopik.find_by(nip: params[:oldNipDosen])
  	bimbingan = Bimbingan.find_by(dosen_pembimbing: dosen.name)
    user = User.find_by(username: params[:oldNipDosen])

  	dosen.nip = params[:nipDosen]
  	dosen.name = params[:namaDosen]
  	dosen.lab = params[:labDosen]
  	dosen.save

    user.nip = params[:nipDosen]
  	user.save


  	if (assignment != nil)
  	  assignment.nip = params[:nipDosen]
  	  assignment.save
  	end
  	if (topik != nil)
  	  topik.nip = params[:nipDosen]
  	  topik.dosen = params[:namaDosen]
  	  topik.save
  	end
  	if (bimbingan != nil)
  	  bimbingan.dosen_pembimbing = params[:namaDosen]
  	  bimbingan.save
  	end

  	redirect_to controller: 'tu', action: 'tu_lihat_user', success: '1'
  end

  def delete_mahasiswa
  	#gatau ntar yg laen gimana efeknya assignment topik dll
  	mahasiswa = Mahasiswa.find_by(nim: params[:deleteNim])
    if mahasiswa != nil
      mahasiswa.destroy
    end

    usr = User.find_by(username:params[:deleteNim])
    if usr != nil
      usr.destroy
    end

  	redirect_to controller: 'tu', action: 'tu_lihat_user', success: '2'

  end

  def delete_dosen
    #gatau ntar yg laen gimana efeknya assignment topik dll
  	dosen = DosenPembimbing.find_by(nip: params[:deleteNip])
  	dosen.destroy

    usr = User.find_by(username:params[:deleteNip])
    usr.destroy

  	redirect_to controller: 'tu', action: 'tu_lihat_user', success: '2'

  end

  def tu_generate_sk
    if(request.post?)
      nomor_sk = params["nomorSK-seminar1"]
      nip_kaprodi = params["nip-seminar1"]
      nim_mhs = params[:nim]
      @mahasiswa = Mahasiswa.find_by(nim: nim_mhs)
      current_sk = SkBimbingan.where(nim_mhs: nim_mhs)

      if(current_sk)
        nomor_sk_ada_yang_sama = false
        for item in current_sk
          if (item.nomor_sk == nomor_sk)
            nomor_sk_ada_yang_sama = true
          end
        end

        if (nomor_sk_ada_yang_sama)
          redirect_to "/tu/mahasiswa/" + nim_mhs, alert: "Nomor SK : "+ nomor_sk +" sudah terpakai"
        else
          for item in current_sk
            item.validitas = 'not_valid'
            item.save!
          end

          sk_bimbingan = SkBimbingan.new
          sk_bimbingan.nomor_sk = nomor_sk
          sk_bimbingan.validitas = 'valid'
          sk_bimbingan.nip_kaprodi = nip_kaprodi
          sk_bimbingan.nim_mhs = nim_mhs
          sk_bimbingan.save!

          redirect_to "/tu/mahasiswa/" + nim_mhs
        end
      else
        sk_bimbingan = SkBimbingan.new
        sk_bimbingan.nomor_sk = nomor_sk
        sk_bimbingan.validitas = 'valid'
        sk_bimbingan.nip_kaprodi = nip_kaprodi
        sk_bimbingan.nim_mhs = nim_mhs
        sk_bimbingan.save!

        redirect_to "/tu/mahasiswa/" + nim_mhs
      end
    end
  end

  def generate_sk
    if(request.post?)
      nomor_sk = params["nomorSK-seminar1"]
      nip_kaprodi = params["nip-seminar1"]
      nim_mhs = params[:nim]

      current_sk = SkBimbingan.where(nim_mhs: nim_mhs)

      if(current_sk)
        for item in current_sk
          item.validitas = 'not_valid'
          item.save!
        end
      else
        puts 'nil'
      end

      sk_bimbingan = SkBimbingan.new
      sk_bimbingan.nomor_sk = nomor_sk
      sk_bimbingan.validitas = 'valid'
      sk_bimbingan.nip_kaprodi = nip_kaprodi
      sk_bimbingan.nim_mhs = nim_mhs
      sk_bimbingan.save!

      @mahasiswa = Mahasiswa.find_by(nim: nim_mhs)
      redirect_to "/tu/mahasiswa/" + nim
    end
  end

  def mahasiswa
    @mahasiswas = Mahasiswa.order('nim')
  end

  def mahasiswa_TAII
    @mahasiswas = Mahasiswa.order('nim')
  end

  def show
    @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
    @assignment = Assignment.find_by(nim: params[:nim])
    @seminar = Seminar.find_by(nim: params[:nim])
    @nilai_akhir = NilaiAkhir.find_by(nim: params[:nim])
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    if @mahasiswa.present?
      render "/tu/mahasiswa/show"
    else
      redirect_to "/tu/mahasiswa/"
    end
  end

  def show_TAII
    @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
    @assignment = Assignment.find_by(nim: params[:nim])
    @seminar2 = Seminar2.find_by(nim: params[:nim])
    @sidang = Sidang.find_by(nim: params[:nim])
    @nilai_akhir = NilaiAkhir2.find_by(nim: params[:nim])
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    if @mahasiswa.present?
      render "/tu/mahasiswa_TAII/show"
    else
      redirect_to "/tu/mahasiswa_TAII/"
    end
  end

end
