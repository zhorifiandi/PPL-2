# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170516083346) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nama"
    t.string   "nip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ajukan_topiks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "mahasiswa"
    t.string   "nim"
    t.string   "topik"
    t.string   "kategori"
    t.string   "nip"
    t.string   "dosen"
    t.string   "prioritas_mahasiswa"
    t.string   "prioritas_dosen"
    t.boolean  "availability"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "assignments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nim"
    t.string   "nip1"
    t.string   "nip2"
    t.string   "judul_topik"
    t.string   "kategori_topik"
    t.string   "nomor_sk"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "bimbingans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "dosen_pembimbing"
    t.datetime "tanggal"
    t.text     "hasildiskusi",     limit: 65535
    t.text     "rencanalanjut",    limit: 65535
    t.date     "tanggalrencana"
    t.string   "mahasiswa"
    t.text     "feedback",         limit: 65535
    t.string   "approved"
    t.integer  "ta"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "dosen_pembimbings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "dosen_ta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dosens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nama"
    t.string   "nip"
    t.string   "dosenta"
    t.string   "dosenpembimbing"
    t.string   "dosenpenguji"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "kategoris", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "kode"
    t.string   "nama"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "mahasiswas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "nim"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "nilai_akhir2s", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nim"
    t.integer  "nilai_tugas"
    t.integer  "nilai_akhir"
    t.integer  "jumlah_presensi"
    t.string   "semester"
    t.string   "tahun_ajaran"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "nilai_akhirs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nim"
    t.integer  "nilai_tugas"
    t.integer  "nilai_akhir"
    t.integer  "jumlah_presensi"
    t.string   "semester"
    t.string   "tahun_ajaran"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "seminar2s", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nim"
    t.string   "nama_mhs"
    t.string   "nip_dosbing1"
    t.string   "nama_dosbing1"
    t.string   "nip_dosbing2"
    t.string   "nama_dosbing2"
    t.string   "topik"
    t.string   "kategori"
    t.text     "berita_acara",                  limit: 65535
    t.string   "nilai_seminar_ta21_pembimbing"
    t.string   "nilai_seminar_ta22_pembimbing"
    t.string   "nilai_seminar_ta23_pembimbing"
    t.string   "nilai_seminar_ta24_pembimbing"
    t.string   "nilai_seminar_ta25_pembimbing"
    t.string   "nilai_seminar_ta26_pembimbing"
    t.string   "nilai_seminar_ta27_pembimbing"
    t.string   "nilai_total_pembimbing"
    t.string   "semester"
    t.string   "tahun_ajaran"
    t.string   "jadwal"
    t.datetime "created_at",                                  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at",                                  default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "seminars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nim"
    t.string   "nama_mhs"
    t.string   "nip_dosbing1"
    t.string   "nama_dosbing1"
    t.string   "nip_dosbing2"
    t.string   "nama_dosbing2"
    t.string   "nip_dosji"
    t.string   "nama_dosji"
    t.string   "topik"
    t.string   "kategori"
    t.text     "berita_acara",               limit: 65535
    t.string   "nilai_seminar1_penguji"
    t.string   "nilai_seminar2_penguji"
    t.string   "nilai_seminar3_penguji"
    t.string   "nilai_seminar3a_penguji"
    t.string   "nilai_seminar3b_penguji"
    t.string   "nilai_seminar3c_penguji"
    t.string   "nilai_seminar4_penguji"
    t.string   "nilai_seminar4a_penguji"
    t.string   "nilai_seminar4b_penguji"
    t.string   "nilai_seminar4c_penguji"
    t.string   "nilai_seminar4d_penguji"
    t.string   "nilai_seminar4e_penguji"
    t.string   "nilai_seminar5_penguji"
    t.string   "nilai_seminar6_penguji"
    t.string   "nilai_total_penguji"
    t.string   "nilai_seminar1_pembimbing"
    t.string   "nilai_seminar2_pembimbing"
    t.string   "nilai_seminar3_pembimbing"
    t.string   "nilai_seminar4_pembimbing"
    t.string   "nilai_seminar4a_pembimbing"
    t.string   "nilai_seminar4b_pembimbing"
    t.string   "nilai_seminar4c_pembimbing"
    t.string   "nilai_seminar5_pembimbing"
    t.string   "nilai_seminar6_pembimbing"
    t.string   "nilai_total_pembimbing"
    t.string   "semester"
    t.string   "tahun_ajaran"
    t.string   "jadwal"
    t.datetime "created_at",                               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at",                               default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "seminarsidangs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nim"
    t.boolean  "seminarta1"
    t.boolean  "seminarta2"
    t.boolean  "sidangta2"
    t.boolean  "laporan_ta"
    t.boolean  "abstrak_ta"
    t.boolean  "makalah"
    t.boolean  "poster"
    t.boolean  "program"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sidangs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nim"
    t.string   "nama_mhs"
    t.string   "nip_dosbing1"
    t.string   "nama_dosbing1"
    t.string   "nip_dosbing2"
    t.string   "nama_dosbing2"
    t.string   "nip_dosji1"
    t.string   "nama_dosji1"
    t.string   "nip_dosji2"
    t.string   "nama_dosji2"
    t.string   "topik"
    t.string   "kategori"
    t.text     "berita_acara",             limit: 65535
    t.string   "nilai_sidang1_penguji1"
    t.string   "nilai_sidang2_penguji1"
    t.string   "nilai_sidang3_penguji1"
    t.string   "nilai_sidang4_penguji1"
    t.string   "nilai_sidang5_penguji1"
    t.string   "nilai_sidang6_penguji1"
    t.string   "nilai_total_penguji1"
    t.string   "nilai_sidang1_penguji2"
    t.string   "nilai_sidang2_penguji2"
    t.string   "nilai_sidang3_penguji2"
    t.string   "nilai_sidang4_penguji2"
    t.string   "nilai_sidang5_penguji2"
    t.string   "nilai_sidang6_penguji2"
    t.string   "nilai_total_penguji2"
    t.string   "nilai_sidang1_pembimbing"
    t.string   "nilai_sidang2_pembimbing"
    t.string   "nilai_sidang3_pembimbing"
    t.string   "nilai_sidang4_pembimbing"
    t.string   "nilai_sidang5_pembimbing"
    t.string   "nilai_sidang6_pembimbing"
    t.string   "nilai_total_pembimbing"
    t.string   "nilai_total"
    t.string   "semester"
    t.string   "tahun_ajaran"
    t.string   "jadwal"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "sk_bimbingans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nomor_sk"
    t.string   "validitas"
    t.string   "nip_kaprodi"
    t.string   "nim_mhs"
    t.datetime "created_at",  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at",  default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nama"
    t.string   "nip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "role"
    t.string   "password_digest"
    t.integer  "id_on_role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
