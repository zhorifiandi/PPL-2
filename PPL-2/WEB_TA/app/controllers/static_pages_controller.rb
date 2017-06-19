class StaticPagesController < ApplicationController
  def home
  end

  def index
  end

  def ajukan_topik
  end

  def minutes_of_meeting
  end

  def dosen_ajukan_topik
    @topikArray = Array.new();
    @topikArray.push('first_topic');
    @topikArray.push('second_topic');
    @topikArray.push('third_topic');

    @b = "asjdoasd"
    @a = DosenPembimbing.find_by(name: 'Yudis the Hacker')
  end

  def save_topik_dosen
    @content_first = "Faza is fucking noob"
    @topikArray = Array.new();
    @topikArray.push('first_topic');
    @content_second = "Faza is fucking noob"
  end
end
