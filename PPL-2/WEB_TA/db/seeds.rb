# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if(Dosen.count == 0)
  Dosen.create(nama: 'Yudis Asnar', nip: '1',  dosenta: 'false', dosenpembimbing: 'true', dosenpenguji: 'true')
  Dosen.create(nama: 'Fazat Nur', nip: '2', dosenta: 'true', dosenpembimbing: 'false', dosenpenguji: 'false')
  Dosen.create(nama: 'Nur Ulfa', nip: '3', dosenta: 'false', dosenpembimbing: 'true', dosenpenguji: 'false')
  Dosen.create(nama: 'Catur', nip: '4', dosenta: 'false', dosenpembimbing: 'false', dosenpenguji: 'true')
end

if(Kategori.count == 0)
  Kategori.create(kode: 'AC', nama: 'Algorithm Complexity')
  Kategori.create(kode: 'CAO', nama: 'Computer Architecture and Organization')
  Kategori.create(kode: 'CS', nama: 'Computational Science')
  Kategori.create(kode: 'DS', nama: 'Discrete Structure')
  Kategori.create(kode: 'GV', nama: 'Graphics and Visualization')
  Kategori.create(kode: 'HCI', nama: 'Human-Computer Interaction')
  Kategori.create(kode: 'IAS', nama: 'Information Assurance and Quality')
  Kategori.create(kode: 'IM', nama: 'Information Management')
  Kategori.create(kode: 'IS', nama: 'Intelligent Systems')
  Kategori.create(kode: 'NC', nama: 'Networking and Communication')
  Kategori.create(kode: 'OS', nama: 'Operating Systems')
  Kategori.create(kode: 'PBD', nama: 'Platform-Based Development')
  Kategori.create(kode: 'PDC', nama: 'Parallel and Distributed Computing')
  Kategori.create(kode: 'PL', nama: 'Programming Languages')
  Kategori.create(kode: 'SDF', nama: 'Software Development Fundamentals')
  Kategori.create(kode: 'SE', nama: 'Software Engineering')
  Kategori.create(kode: 'SF', nama: 'Systems Fundamentals')
  Kategori.create(kode: 'SIPP', nama: 'Social Issues and Professional Practice')
end

if(Mahasiswa.count==0)
  Mahasiswa.create(name: 'Geraldi Dzakwan', nim: '13514065')
	Mahasiswa.create(name: 'Praditya Raudi A', nim: '13514087')
	Mahasiswa.create(name: 'Ramos Janoah', nim: '13514089')
end

if(AjukanTopik.count==0)
	# AjukanTopik.create(mahasiswa: 'Geraldi Dzakwan', nim: '13514065', topik: 'Hacking Yudis', kategori: 'Information Assurance and Quality', nip: '1234567890', dosen: 'Yudis the Hacker', prioritas_mahasiswa: '2', prioritas_dosen: '2')
	# AjukanTopik.create(mahasiswa: 'Geraldi Dzakwan', nim: '13514065', topik: 'Hacking Yudis The Hacker', kategori: 'Information Assurance and Quality', nip: '1234567890', dosen: 'Yudis the Hacker', prioritas_mahasiswa: '1', prioritas_dosen: '-1')
	# AjukanTopik.create(mahasiswa: 'Ramos Janoah', nim: '13514089', topik: 'Hacking 101', kategori: 'Information Assurance and Quality', nip: '1234567890', dosen: 'Yudis the Hacker', prioritas_mahasiswa: '1', prioritas_dosen: '1')
  AjukanTopik.create(mahasiswa: 'Ramos Janoah', nim: '13514089', topik: 'Hacking 101', kategori: 'Information Assurance and Quality', nip: '1', dosen: 'Yudis the Hacker', prioritas_mahasiswa: '1')
  AjukanTopik.create(mahasiswa: 'Ramos Janoah', nim: '13514089', topik: 'Hacking 102', kategori: 'Information Assurance and Quality', nip: '1', dosen: 'Yudis the Hacker', prioritas_mahasiswa: '2')
end

if(User.count==0)
  User.create(username: '000000', role: 'tu', password_digest: '$2a$10$QTbIQYPJydDWBuzHeOb5xud81C/3NxJ.FJOLlJZASLUdDhj3Bzigy', id_on_role: '1')
  User.create(username: '1', role: 'dosen', password_digest: '$2a$10$2nwAloEQaVfiJ4ZvI.ykueo.N9fI3JptI4lNi0RHBPiOyhiQEYEHK', id_on_role: '1')
  User.create(username: '2', role: 'dosen', password_digest: '$2a$10$qJGZmxmBgoTYgTnr6vOuzO48AnxudqyuYwBfpELh/e.eUAvberAAS', id_on_role: '2')
  User.create(username: '3', role: 'dosen', password_digest: '$2a$10$h/ill7V.w2PEdPJwnmWWEuQjDGtcJs8q3.H1zwLNVW7GWvCr.5YL.', id_on_role: '3')
  User.create(username: '4', role: 'dosen', password_digest: '$2a$10$e6QhKRPhgjR8xPKUS287m.oPlP.R1hj73UcAlyozZy0WNYKvRfYRW', id_on_role: '4')
  User.create(username: '10', role: 'admin', password_digest: '$2a$10$0BUiRUyyKeUdY/epRvu1z.KRd9s/AERBSP0/W1rer0CzJlOcEMAhK', id_on_role: '10')
  User.create(username: '13514065', role: 'mahasiswa', password_digest: '$2a$10$uFKdTQKPe./DAD/0jbgADexfYiGpmKTKB4tNZvU4sWUiIWQnPu2J.', id_on_role: '5')
  User.create(username: '13514087', role: 'mahasiswa', password_digest: '$2a$10$g697m1RIePjKhgALpJhChuyGGK8sleNjhZP3V2bdQ4j0reCHo7X7S', id_on_role: '5')
  User.create(username: '13514089', role: 'mahasiswa', password_digest: '$2a$10$HnTQCkfrGHFAywIIWwnmKeW5S1pdUUFeK3IZcyCKIEiVVTlYL26x6', id_on_role: '5')
end

if(Assignment.count==0)
  Assignment.create(nim: '13514065', nip1: '1', nip2: '2', judul_topik: 'Hacking Jaringan Telekomunikasi', kategori_topik: 'Security', nomor_sk: 'tbd')
  Assignment.create(nim: '13514087', nip1: '1', nip2: '2', judul_topik: 'Hacking Jaringan Telekomunikasi', kategori_topik: 'Security', nomor_sk: 'tbd')
end

if(Seminar.count==0)
  Seminar.create(nim: '13514065', nama_mhs: 'Geraldi Dzakwan', nip_dosbing1: '1', nama_dosbing1: 'Yudis Asnar', nip_dosbing2: '2', nama_dosbing2: 'Fazat Nur', nip_dosji: '1234567891', nama_dosji: 'Yudisthira Ashar Wardhana', topik: 'Machine Learning', kategori: 'GaIB', berita_acara: 'alhamdulillah lulus', semester: '1', tahun_ajaran:'2016/2017', jadwal: 'kosong')
  Seminar.create(nim: '13514087', nama_mhs: 'Praditya Raudi', nip_dosbing1: '1', nama_dosbing1: 'Yudis Asnar', nip_dosbing2: '2', nama_dosbing2: 'Fazat Nur', nip_dosji: '1', nama_dosji: 'Yudis Asnar', topik: 'Machine Learning', kategori: 'GaIB', berita_acara: 'alhamdulillah lulus', semester: '1', tahun_ajaran:'2016/2017', jadwal: 'kosong')
end

if(Sidang.count==0)
  Sidang.create(nim: '13514065', nama_mhs: 'Geraldi Dzakwan',  nip_dosbing1: '1', nama_dosbing1: 'Yudis Asnar', nip_dosbing2: '2', nama_dosbing2: 'Fazat Nur', nip_dosji1: '3', nama_dosji1: 'Nur Ulfa', nip_dosji2: '1', nama_dosji2: 'Yudis Asnar', topik: 'Machine Learning', kategori: 'GaIB', berita_acara: 'alhamdulillah lulus', semester: '1', tahun_ajaran:'2016/2017')
  Sidang.create(nim: '13514087', nama_mhs: 'Praditya Raudi',  nip_dosbing1: '1', nama_dosbing1: 'Yudis Asnar', nip_dosbing2: '2', nama_dosbing2: 'Fazat Nur', nip_dosji1: '1', nama_dosji1: 'Yudis Asnar', nip_dosji2: '3', nama_dosji2: 'Nur Ulfa', topik: 'Machine Learning', kategori: 'GaIB', berita_acara: 'alhamdulillah lulus', semester: '1', tahun_ajaran:'2016/2017')
end

if(Seminar2.count==0)
  Seminar2.create(nim: '13514065', nama_mhs: 'Geraldi Dzakwan', nip_dosbing1: '1', nama_dosbing1: 'Yudis Asnar', nip_dosbing2: '2', nama_dosbing2: 'Fazat Nur', topik: 'Machine Learning', kategori: 'GaIB', berita_acara: 'alhamdulillah lulus', semester: '1', tahun_ajaran:'2016/2017', jadwal: 'kosong')
  Seminar2.create(nim: '13514087', nama_mhs: 'Praditya Raudi', nip_dosbing1: '1', nama_dosbing1: 'Yudis Asnar', nip_dosbing2: '2', nama_dosbing2: 'Fazat Nur', topik: 'Machine Learning', kategori: 'GaIB', berita_acara: 'alhamdulillah lulus', semester: '1', tahun_ajaran:'2016/2017', jadwal: 'kosong')
end

if(NilaiAkhir.count==0)
  NilaiAkhir.create(nim: '13514065', nilai_tugas: '10', jumlah_presensi: '10', semester: '1', tahun_ajaran: '2016/2017')
end

if(NilaiAkhir2.count==0)
  NilaiAkhir2.create(nim: '13514065', nilai_tugas: '10', jumlah_presensi: '10', semester: '1', tahun_ajaran: '2016/2017')
end
