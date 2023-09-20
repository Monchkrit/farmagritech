class Accounting < ApplicationRecord
  
  def list_job(garden_id, job_id, start_time, finish_time, farmer_id, gardener_id)
    lineitem = Accounting.new
    lineitem.garden = garden_id
    lineitem.job = job_id
    lineitem.start_time = start_time
    lineitem.finish_time = finish_time
    lineitem.farmer_id = farmer_id
    lineitem.gardener_id = gardener_id
    lineitem.save!
  end

  def time_spent(start_time, finish_time)
    time_spent = ((finish_time - start_time) / 3600).round(2)
  end

  def self.time_sum(e, garden)
    jobs = Job.where(:gardener_id => e.user_id, :garden_id => garden)
    t = 0.0
    time = 0.0
    jobs.each do |j|
      unless j.finish_time.blank?
      time = ((j.finish_time - j.start_time) / 3600).round(2)
      end
      t = t + time
    end
    time_sum = t.round(2)
  end
end
