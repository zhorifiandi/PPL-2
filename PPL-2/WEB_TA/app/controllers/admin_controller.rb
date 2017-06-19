class AdminController < ApplicationController
  def registrasi_user
  end

  def lihat_user
    @search = params[:search]
  	if (@search == nil)
  	  @mahasiswa = Mahasiswa.all
  	  @dosen = Dosen.all
      @tu = Tu.all
      @admin = Admin.all
  	else
  	  @mahasiswa = Mahasiswa.where('nim LIKE ?', "%#{@search}%").or(Mahasiswa.where('name LIKE ?', "%#{@search}%"))
  	  @dosen = Dosen.where('nip LIKE ?', "%#{@search}%").or(Dosen.where('nama LIKE ?', "%#{@search}%"))
      @tu = Tu.where('nip LIKE ?', "%#{@search}%").or(Tu.where('nama LIKE ?', "%#{@search}%"))
      @admin = Admin.where('nip LIKE ?', "%#{@search}%").or(Admin.where('nama LIKE ?', "%#{@search}%"))
    end
  end

  def add_mahasiswa
  	nama = params[:nama]
  	@nim = params[:nim]
  	password = params[:password]
  	check1 = Mahasiswa.find_by(nim: @nim)
    check2 = User.find_by(username: @nim)
  	if (check1 != nil || check2 != nil)
  	  redirect_to controller: 'admin', action: 'registrasi_user', success: '0', nama: nama, nip: @nim, role: 'Mahasiswa'
  	else

      #Add to Mahasiswa Table
      object = Mahasiswa.new(:name => nama, :nim => @nim)
      object.save

      #Add to User Table
      usr = User.new(:username => @nim, :password => password, :role => "mahasiswa", :id_on_role => object.id)
      usr.save
      redirect_to controller: 'admin', action: 'registrasi_user', success: '1', nama: nama, nip: @nim, role: 'Mahasiswa'
    end
  end

  def add_dosen
  	nama = params[:nama]
  	@nip = params[:nip]
  	role = ''
    counter = 0
    if (params[:dosenta] != nil)
      if (counter > 0)
        role += ', '
      else
        counter += 1
      end
      role += params[:dosenta]
      dosenta = 'true'
    else
      dosenta = 'false'
    end
    if (params[:dosenpembimbing] != nil)
      if (counter > 0)
        role += ', '
      else
        counter += 1
      end
      role += params[:dosenpembimbing]
      dosenpembimbing = 'true'
    else
      dosenpembimbing = 'false'
    end
    if (params[:dosenpenguji] != nil)
      if (counter > 0)
        role += ', '
      else
        counter += 1
      end
      role += params[:dosenpenguji]
      dosenpenguji = 'true'
    else
      dosenpenguji = 'false'
    end
    password = params[:password]
  	check1 = Dosen.find_by(nip: @nip)
    check2 = User.find_by(username: @nip)
  	if (check1 != nil || check2 != nil)
  	  redirect_to controller: 'admin', action: 'registrasi_user', success: '0', nama: nama, nip: @nip
  	else
        #Add to Dosbing Table
        object = Dosen.new(:nama => nama, :nip => @nip, :dosenta => dosenta, :dosenpembimbing => dosenpembimbing, :dosenpenguji => dosenpenguji)
     	  object.save

        #Add to User Table
        usr = User.new(:username => @nip, :password => password, :role => "dosen", :id_on_role => object.id)
        usr.save
        redirect_to controller: 'admin', action: 'registrasi_user', success: '1', nama: nama, nip: @nip, role: role
  	end
  end

  def add_tu
    nama = params[:nama]
  	@nip = params[:nip]
  	password = params[:password]
  	check1 = Tu.find_by(nip: @nip)
    check2 = User.find_by(username: @nip)
  	if (check1 != nil || check2 != nil)
  	  redirect_to controller: 'admin', action: 'registrasi_user', success: '0', nama:nama, nip:@nip, role: 'Tata Usaha'
  	else
        #Add to Dosbing Table
        object = Tu.new(:nama => nama, :nip => @nip)
     	  object.save

        #Add to User Table
        usr = User.new(:username => @nip, :password => password, :role => "tu", :id_on_role => object.id)
        usr.save
    	  redirect_to controller: 'admin', action: 'registrasi_user', success: '1', nama:nama, nip:@nip, role: 'Tata Usaha'
  	end
  end

  def add_admin
  	nama = params[:nama]
  	@nip = params[:nip]
  	password = params[:password]
  	check1 = Admin.find_by(nip: @nip)
    check2 = User.find_by(username: @nip)
  	if (check1 != nil || check2 != nil)
  	  redirect_to controller: 'admin', action: 'registrasi_user', success: '0', nama: nama, nip: @nip, role: 'Admin'
  	else
        #Add to Dosbing Table
        object = Admin.new(:nama => nama, :nip => @nip)
     	  object.save

        #Add to User Table
        usr = User.new(:username => @nip, :password => password, :role => "admin", :id_on_role => object.id)
        usr.save
    	  redirect_to controller: 'admin', action: 'registrasi_user', success: '1', nama: nama, nip: @nip, role: 'Admin'
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

    user.username = params[:nim]
    user.save

  	mahasiswa.save
  	assignment.save
  	topik.save
  	bimbingan.save

  	redirect_to controller: 'admin', action: 'lihat_user', success: '1', nama: mahasiswa.name, nip: mahasiswa.nim

  end

  def edit_dosen
  	dosen = Dosen.find_by(nip: params[:oldNipDosen])
  	assignment1 = Assignment.where('nip1 = ?', params[:oldNipDosen])
    assignment2 = Assignment.where('nip2 = ?', params[:oldNipDosen])
  	topik = AjukanTopik.where('nip = ?', params[:oldNipDosen])
  	bimbingan = Bimbingan.where('dosen_pembimbing = ?', dosen.nama)
    user = User.find_by(username: params[:oldNipDosen])
    if (params[:dosenta] != nil)
      dosenta = 'true'
    else
      dosenta = 'false'
    end
    if (params[:dosenpembimbing] != nil)
      dosenpembimbing = 'true'
    else
      dosenpembimbing = 'false'
    end
    if (params[:dosenpenguji] != nil)
      dosenpenguji = 'true'
    else
      dosenpenguji = 'false'
    end

  	dosen.nip = params[:nipDosen]
  	dosen.nama = params[:namaDosen]
  	dosen.dosenta = dosenta
    dosen.dosenpembimbing = dosenpembimbing
    dosen.dosenpenguji = dosenpenguji
  	dosen.save

    user.username = params[:nipDosen]
  	user.save


  	if (assignment1 != nil)
  	  assignment1.each do |ass|
        ass.nip1 = params[:nipDosen]
  	    ass.save
      end
  	end
    if (assignment2 != nil)
  	  assignment2.each do |ass|
        ass.nip2 = params[:nipDosen]
  	    ass.save
      end
  	end
  	if (topik != nil)
  	  topik.each do |tpk|
        tpk.nip = params[:nipDosen]
  	    tpk.dosen = params[:namaDosen]
  	    tpk.save
      end
    end
  	if (bimbingan != nil)
      bimbingan.each do |bim|
    	  bim.dosen_pembimbing = params[:namaDosen]
    	  bim.save
      end
  	end

  	redirect_to controller: 'admin', action: 'lihat_user', success: '1', nama: dosen.nama, nip: dosen.nip
  end

  def edit_tu
  	tu = Tu.find_by(nip: params[:oldNipTU])
  	user = User.find_by(username: params[:oldNipTU])

  	tu.nip = params[:nipTU]
  	tu.nama = params[:namaTU]
  	tu.save

    user.username = params[:nipTU]
  	user.save

  	redirect_to controller: 'admin', action: 'lihat_user', success: '1', nama: tu.nama, nip: tu.nip
  end

  def edit_admin
  	admin = Admin.find_by(nip: params[:oldNipAdmin])
  	user = User.find_by(username: params[:oldNipAdmin])

  	admin.nip = params[:nipAdmin]
  	admin.nama = params[:namaAdmin]
  	admin.save

    user.username = params[:nipAdmin]
  	user.save

  	redirect_to controller: 'admin', action: 'lihat_user', success: '1', nama: admin.nama, nip: admin.nip
  end

  def delete_mahasiswa
  	#gatau ntar yg laen gimana efeknya assignment topik dll
  	mahasiswa = Mahasiswa.find_by(nim: params[:deleteNim])
    if mahasiswa != nil
      nama = mahasiswa.name
      nim = mahasiswa.nim
      mahasiswa.destroy
    end

    usr = User.find_by(username:params[:deleteNim])
    if usr != nil
      usr.destroy
    end

  	redirect_to controller: 'admin', action: 'lihat_user', success: '2', nama: nama, nip: nim

  end

  def delete_dosen
    #gatau ntar yg laen gimana efeknya assignment topik dll
  	dosen = Dosen.find_by(nip: params[:deleteNip])
    if dosen != nil
      nama = dosen.nama
      nip = dosen.nip
  	  dosen.destroy
    end

    usr = User.find_by(username:params[:deleteNip])
    if usr != nil
      usr.destroy
    end

  	redirect_to controller: 'admin', action: 'lihat_user', success: '2', nama: nama, nip: nip

  end

  def delete_tu
    tu = Tu.find_by(nip: params[:deleteNipTU])
    if tu != nil
      nama = tu.nama
      nip = tu.nip
  	  tu.destroy
    end

    usr = User.find_by(username:params[:deleteNipTU])
    if usr != nil
      usr.destroy
    end

  	redirect_to controller: 'admin', action: 'lihat_user', success: '2', nama: nama, nip: nip

  end

  def delete_admin
    admin = Admin.find_by(nip: params[:deleteNipAdmin])
    if admin != nil
      nama = admin.nama
      nip = admin.nip
  	  admin.destroy
    end

    usr = User.find_by(username:params[:deleteNipAdmin])
    if usr != nil
      usr.destroy
    end

  	redirect_to controller: 'admin', action: 'lihat_user', success: '2', nama: nama, nip: nip

  end

  def fetch_data_mahasiswa
  	@mahasiswa = Mahasiswa.find_by(nim: params[:nim])
  	@bimbingan = Assignment.find_by(nim: params[:nim])
  	if (@bimbingan != nil)
  	  @dosen1 = Dosen.find_by(nip: @bimbingan.nip1)
      @dosen2 = Dosen.find_by(nip: @bimbingan.nip2)
  	end
  	respond_to do |format|
     msg = { :mahasiswa => @mahasiswa, :bimbingan => @bimbingan, :dosen1 => @dosen1, :dosen2 => @dosen2, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def fetch_data_dosen
  	@dosen = Dosen.find_by(nip: params[:nip])

  	respond_to do |format|
     msg = { :dosen => @dosen, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def fetch_data_tu
  	@tu = Tu.find_by(nip: params[:nip])

  	respond_to do |format|
     msg = { :tu => @tu, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def fetch_data_admin
  	@admin = Admin.find_by(nip: params[:nip])

  	respond_to do |format|
     msg = { :admin => @admin, :status => "ok", :message => "Success!", :html => "<b>...</b>" }
     format.json  { render :json => msg } # don't do msg.to_json
    end
  end

end
