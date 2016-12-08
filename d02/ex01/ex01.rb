# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex01.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/07 12:47:17 by clegoube          #+#    #+#              #
#    Updated: 2016/12/07 12:47:19 by clegoube         ###   ########.fr        #
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
		begin
			if File.file?("#{@page_name}.html")
				raise "A file named #{@page_name}.html already exist!"
			end
		end
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
		begin
			if File.readlines("#{@page_name}.html").grep(/<body>/).size == 0
				raise "There is no body tag in #{@page_name}.html"
			end
			if File.readlines("#{@page_name}.html").grep(/<\/body>/).size > 0
				raise "Body has already been closed in #{@page_name}.html"
			end
		end
		file = File.open("#{@page_name}.html", "a")
		file << "		<p>#{string}</p>\n"
		file.close
	end
	def finish
		begin
			if File.readlines("#{@page_name}.html").grep(/<\/body>/).size > 0
				raise "#{@page_name}.html has already been closed"
			end
		end
		file = File.open("#{@page_name}.html", "a")
		file << "	</body>\n"
		file.close
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end
