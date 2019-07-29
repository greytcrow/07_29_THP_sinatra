require 'bundler'
Bundler.require

class Gossip
	attr_accessor :auteur, :content
	
	def initialize(author, didyousay)
			@auteur = author
			@content = didyousay
	end

	def save
	  CSV.open("./db/gossip.csv", "ab") do |csv|
  	  csv << [@auteur, @content]
		end
	end
	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		return all_gossips
	end
end