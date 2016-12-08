# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex00.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/07 11:58:47 by clegoube          #+#    #+#              #
#    Updated: 2016/12/07 11:58:49 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

class Html
	attr_reader :title
	def initialize(title)
		@page_name =  title
		self.head
	end
	def head
		file = File.open("#{@page_name}.html", "w")
		file << "<!DOCTYPE html>\n"
		file << "<html>\n"
		file << "	<head>\n"
		file << "		<meta charset =\"utf-8\">\n"
		file << "		<title>#{@page_name}</title>\n"
		file << "	</head>\n"
		file << "	<body>\n"
		file.close
	end
	def dump(string)
		file = File.open("#{@page_name}.html", "a")
		file << "		<p>#{string}</p>\n"
		file.close
	end
	def finish
		file = File.open("#{@page_name}.html", "a")
		file.write("	</body>\n")
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end
