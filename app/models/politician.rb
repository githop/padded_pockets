class Politician < ActiveRecord::Base
  has_many :comments
  has_many :contributions



  def fetch_donations
    candidate = $cand.contributors({cid: self.opensecrets_id})['response']['contributors']['contributor']

    candidate.each do |contrib|
      contributions.create(org_name: contrib["org_name"], total: contrib["total"])
    end
  end

  def get_chart_data
    data = self.contributions
    chart_headers = [["Organization", "Total"]]
    data.each do |contrib|
      chart_headers << [contrib.org_name.to_s, contrib.total]
    end
    chart_headers
  end


end


