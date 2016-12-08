# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ex02.rb                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/07 15:42:32 by clegoube          #+#    #+#              #
#    Updated: 2016/12/07 15:42:33 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

class Dup_file < StandardError
	def show_state(filename)
		puts "A file named #{filename} was already there: " + File.absolute_path("#{filename}.html")
	end
	def correct(filename)
		if File.file?("#{filename}.html")
			@page_name = filename + '.new'
			self.show_state(@page_name)
			self.correct(@page_name)
		end
		return @page_name
	end
	def explain(filename)
		puts "Appended .new in order to create requested file: " + File.absolute_path("#{filename}.html")
	end
end

class Body_closed < StandardError
	def show_state(filename)
		line = self.get_line_number(filename, "</body>")
		puts "In #{filename} body was closed :"
		return line
	end
	def correct(filename)
		split_file = File.open("#{filename}.html", "r") { |f| f.read.split("\n") }
		split_file.delete("\t</body>")
		File.open("#{filename}.html", "w") { |f| f.write(split_file.join("\n") + "\n") }
	end
	def explain(line)
		puts "	> ln :#{line} </body> : text has been inserted and tag moved at end of it"
	end
	def get_line_number(filename, word)
		count = 0
		file = File.open("#{filename}.html", "r") { |file| file.each_line { |line|
			count += 1
		return count if line =~ /#{word}/
		}}
	end
end

class Html
	attr_reader :title
	def initialize(title)
		@page_name =  title
		self.head
	end
	def head
		begin
			if File.file?("#{@page_name}.html")
				raise Dup_file, (@page_name)
			end
			rescue => error
				error.show_state(@page_name)
				@page_name  = error.correct(@page_name)
				error.explain(@page_name)
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
				raise Body_closed, "There is no body tag in #{@page_name}.html"
			end
			if File.readlines("#{@page_name}.html").grep(/<\/body>/).size > 0
				raise Body_closed, (@page_name)
			end
			rescue => error
				line = error.show_state(@page_name)
				error.correct(@page_name)
				file = File.open("#{@page_name}.html", "a")
				file << "		<p>#{string}</p>\n"
				file << "\t</body>\n"
				file.close
				error.explain(line)
		end
	end
	def finish
		begin
			if File.readlines("#{@page_name}.html").grep(/<\/body>/).size > 0
				raise "#{@page_name}.html has already been closed"
			end
		end
		file = File.open("#{@page_name}.html", "a")
		file << "\t</body>\n"
		file.close
	end
end

if $PROGRAM_NAME == __FILE__
	a = Html.new("test")
	10.times{|x| a.dump("titi_number#{x}")}
	a.finish
end
