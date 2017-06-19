class Mahasiswa < ApplicationRecord
  serialize :list_of_topic, Array
  serialize :topic_category, Array
  serialize :topic_dosbing, Array
  serialize :topic_source, Array
  serialize :list_of_bimbingans, Array
  serialize :list_of_nilai_seminar, Array
  serialize :list_of_nilai_sidang, Array
  
  def self.list_of_nilai_seminar_constant_1
    ["0", "0", "0"]
  end

  def self.list_of_nilai_sidang_constant_1
    ["0", "0", "0", "0"]
  end
end
