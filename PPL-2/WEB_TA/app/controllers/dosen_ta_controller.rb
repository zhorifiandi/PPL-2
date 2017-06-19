class DosenTaController < ApplicationController
  def mahasiswa
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @mahasiswas = Mahasiswa.order('nim')
  end

  def show
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
    @assignment = Assignment.find_by(nim: params[:nim])
    @seminar = Seminar.find_by(nim: params[:nim])
    @nilai_akhir = NilaiAkhir.find_by(nim: params[:nim])
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    if @mahasiswa.present?
      render "/dosen_ta/mahasiswa/show"
    else
      redirect_to "/dosen_ta/mahasiswa/"
    end
  end

  def mahasiswa_ta2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @mahasiswas = Mahasiswa.order('nim')
  end

  def show_ta2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
    @assignment = Assignment.find_by(nim: params[:nim])
    @seminar2 = Seminar2.find_by(nim: params[:nim])
    @sidang = Sidang.find_by(nim: params[:nim])
    @nilai_akhir = NilaiAkhir2.find_by(nim: params[:nim])
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    if @mahasiswa.present?
      render "/dosen_ta/mahasiswa/show_ta2"
    else
      redirect_to "/dosen_ta/mahasiswa_ta2/"
    end
  end

  def submit_nilai
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @nilai_akhir = params[:nilai_akhir]
    @nim = params[:nim]

    @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
    # Save Nilai Akhir
    @nilaifinal = NilaiAkhir.find_or_initialize_by(nim: params[:nim])
    @nilaifinal.nim = @nim
    @nilaifinal.nilai_akhir = @nilai_akhir
    @nilaifinal.save!

        redirect_to "/dosen_ta/mahasiswa" ,notice: 'Nilai untuk NIM ' +params[:nim]+ ' telah berhasil diperbaharui'
  end

  def submit_nilai_ta2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @nilai_akhir = params[:nilai_akhir]
    @nim = params[:nim]

    @mahasiswa = Mahasiswa.find_by(nim: params[:nim])
    # Save Nilai Akhir
    @nilaifinal = NilaiAkhir2.find_or_initialize_by(nim: params[:nim])
    @nilaifinal.nim = @nim
    @nilaifinal.nilai = @nilai_akhir
    @nilaifinal.save!

    redirect_to "/dosen_ta/mahasiswa_ta2" ,notice: 'Nilai untuk NIM ' +params[:nim]+ ' telah berhasil diperbaharui'
  end

  def assignment_topik
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @mahasiswas = Mahasiswa.order('nim')
  end
  def assignment_penguji
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @seminarta1s = Seminar.order('nim')
  end
  def assignment_penguji_ta2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @seminarta1s = Seminar.order('nim')
    @seminarta2s = Seminar2.order('nim')
    @sidangs = Sidang.order('nim')
  end
  def approve_seminar1
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    @approval.seminarta1 = true
    @approval.save!

    @seminar = Seminar.find_or_initialize_by(nim: params[:nim])
    @seminar.nim = params[:nim]
    @seminar.nama_mhs = Mahasiswa.find_by(nim: params[:nim]).name
    assignment = Assignment.find_by(nim: params[:nim])
    if assignment != nil
      @seminar.nip_dosbing = assignment.nip
      @seminar.topik = assignment.judul_topik
      @seminar.kategori = assignment.kategori_topik
      dosbing = Dosen.find_by(nip: @seminar.nip_dosbing)
      @seminar.nama_dosbing = dosbing.nama
    end
    @seminar.save!

    redirect_to "/dosen_ta/mahasiswa",notice: 'Seminar TA I untuk NIM ' +params[:nim]+ ' telah berhasil disetujui'
  end
  def approve_seminar2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    @approval.seminarta2 = true
    @approval.save!

    @seminar = Seminar2.find_or_initialize_by(nim: params[:nim])
    @seminar.nim = params[:nim]
    @seminar.nama_mhs = Mahasiswa.find_by(nim: params[:nim]).name
    assignment = Assignment.find_by(nim: params[:nim])
    if assignment != nil
      @seminar.nip_dosbing = assignment.nip
      dosbing = Dosen.find_by(nip: @seminar.nip_dosbing)
      @seminar.nama_dosbing = dosbing.nama
    end
    @seminar.save!
    redirect_to "/dosen_ta/mahasiswa_ta2" , notice: 'Seminar TA II untuk NIM ' +params[:nim]+ ' telah berhasil disetujui'
  end
  def approve_sidang2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    @approval.sidangta2 = true
    @approval.save!

    @sidang = Sidang.find_or_initialize_by(nim: params[:nim])
    @sidang.nim = params[:nim]
    @sidang.nama_mhs = Mahasiswa.find_by(nim: params[:nim]).name
    assignment = Assignment.find_by(nim: params[:nim])
    if assignment != nil
      @sidang.nip_dosbing = assignment.nip
      dosbing = Dosen.find_by(nip: @sidang.nip_dosbing)
      @sidang.nama_dosbing = dosbing.nama
    end
    @sidang.save!
    redirect_to "/dosen_ta/mahasiswa_ta2" , notice: 'Sidang TA II untuk NIM ' +params[:nim]+ ' telah berhasil disetujui'
  end
  def disapprove_seminar1
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    @approval.seminarta1 = false
    @approval.save!

    seminar = Seminar.find_by(nim: params[:nim])
    if seminar != nil
      seminar.destroy
    end
    redirect_to "/dosen_ta/mahasiswa" , notice: 'Seminar TA I untuk NIM ' +params[:nim]+ ' telah berhasil dibatalkan'
  end
  def disapprove_seminar2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    @approval.seminarta2 = false
    @approval.save!

    seminar = Seminar2.find_by(nim: params[:nim])
    if seminar != nil
      seminar.destroy
    end

    redirect_to "/dosen_ta/mahasiswa" , notice: 'Seminar TA II untuk NIM ' +params[:nim]+ ' telah berhasil dibatalkan'
  end
  def disapprove_sidang2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @approval = Seminarsidang.find_or_initialize_by(nim: params[:nim])
    @approval.sidangta2 = false
    @approval.save!

    seminar = Sidang.find_by(nim: params[:nim])
    if seminar != nil
      seminar.destroy
    end

    redirect_to "/dosen_ta/mahasiswa" , notice: 'Sidang TA II untuk NIM ' +params[:nim]+ ' telah berhasil dibatalkan'
  end
  def assignment_topik
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @mahasiswas = Mahasiswa.order('nim')

  end
  def do_assignment
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @nip = params[:nip]
  	@nim = params[:nim]
  	@topik = params[:topik]
  	@kategori = params[:kategori]

  	AjukanTopik.where(:nim => @nim).destroy_all
  	object = Assignment.new(:nip => @nip, :nim => @nim, :judul_topik => @topik, :kategori_topik => @kategori, :nomor_sk => 'tbd')
   	object.save

    redirect_to "/dosen_ta/assignment_topik" , notice: 'Assignment telah berhasil dilakukan'
  end
  def assign_penguji_seminar1
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @seminar = Seminar.find_by(nim: params[:nim])
    @seminar.nip_dosji = params[:nip]
    dosji = Dosen.find_by(nip: params[:nip])
    if dosji == nil
      redirect_to "/dosen_ta/assignment_penguji" , alert: 'NIP dosen tidak dapat ditemukan'
    else
      @seminar.nama_dosji = dosji.nama
      @seminar.save!
      dosji.dosenpenguji = 'true'
      dosji.save
      redirect_to "/dosen_ta/assignment_penguji" , notice: 'Seminar TA I untuk NIM ' +params[:nim]+ ' telah berhasil dialokasikan'
    end
  end

  def assign_penguji_seminar2
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @seminar = Seminar2.find_by(nim: params[:nim])
    @seminar.nip_dosji = params[:nip]
    dosji = Dosen.find_by(nip: params[:nip])
    if dosji == nil
      redirect_to "/dosen_ta/assignment_penguji_ta2" , alert: 'NIP dosen tidak dapat ditemukan'
    else
      @seminar.nama_dosji = dosji.nama
      @seminar.save!
      dosji.dosenpenguji = 'true'
      dosji.save
      redirect_to "/dosen_ta/assignment_penguji_ta2" , notice: 'Seminar TA II untuk NIM ' +params[:nim]+ ' telah berhasil dialokasikan'
    end
  end

  def assign_penguji_sidang
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
    @seminar = Sidang.find_by(nim: params[:nim])
    @seminar.nip_dosji1 = params[:nip]
    dosji = Dosen.find_by(nip: params[:nip])
    @seminar.nama_dosji1 = dosji.nama
    @seminar.save!
    dosji.dosenpenguji = 'true'
    dosji.save
    redirect_to "/dosen_ta/assignment_penguji" , notice: 'Sidang TA II untuk NIM ' +params[:nim]+ ' telah berhasil dialokasikan'

  end
  def index
    dosen = Dosen.find_by(nip: current_user.username)
    if (dosen.dosenta == 'false')
      redirect_to "/dosens/pilih_role/" , notice: "Maaf, anda tidak memiliki akses ke laman dosen TA"
    end
  end
end
