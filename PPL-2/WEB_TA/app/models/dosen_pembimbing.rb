class DosenPembimbing < ApplicationRecord
  serialize :list_of_topic, Array
  serialize :topic_category, Array
  serialize :topic_availability, Array
  serialize :list_of_bimbingans, Array

  def self.list_of_topic_constant_1
    ["Topic 1-1", "Topic 1-2", "Topic 1-3", "Topic 1-4", "Topic 1-5", "Topic 1-6"]
  end

  def self.list_of_topic_constant_2
    ["Topic 2-1", "Topic 2-2", "Topic 2-3", "Topic 2-4", "Topic 2-5", "Topic 2-6"]
  end

  def self.list_of_category_constant_1
    ["Platform-Based Development", "Software Engineering", "Systems Fundamentals", "Platform-Based Development", "Software Engineering", "Systems Fundamentals"]
  end

  def self.list_of_category_constant_2
    ["Intelligent Systems", "Computational Science", "Graphics and Visualization", "Intelligent Systems", "Computational Science", "Graphics and Visualization"]
  end

  def self.list_of_availability_constant_1
    ["1", "1", "1"]
  end

  def self.list_of_availability_constant_2
    ["1", "1", "1"]
  end
end
