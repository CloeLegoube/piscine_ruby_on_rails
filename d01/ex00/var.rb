# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    var.rb                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 11:53:50 by clegoube          #+#    #+#              #
#    Updated: 2016/12/06 11:53:52 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

def 	my_fonction()
	a = 10
	b = "10"
	c = "dix"
	d = 10.0
	puts "mes variables :"
	puts "        a contient #{a} et est de type: #{a.class}"
	puts "        b contient #{b} et est de type: #{b.class}"
	puts "        c contient #{c} et est de type: #{c.class}"
	puts "        d contient #{d} et est de type: #{d.class}"
end

my_fonction
