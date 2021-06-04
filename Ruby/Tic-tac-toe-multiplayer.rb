class Ttt
	attr_accessor :player1 , :marker1 , :player2 , :marker2 , :entry , :arrp1 , :arrp2
	def initialize(player1, marker1, player2, marker2)
		@player1 = player1
		@marker1 = marker1
		@player2 = player2
		@marker2 = marker2
		@entry = ["1","2","3","4","5",'6','7','8','9']
		@arrp1 = []
		@arrp2 = []
	end

	def display
		puts entry[0]+' | '+entry[1]+' | '+entry[2]
		puts "---------"
		puts entry[3]+' | '+entry[4]+' | '+entry[5]
		puts "---------"
		puts entry[6]+' | '+entry[7]+' | '+entry[8]
	end

	def take_inp1
		display
		puts "#{player1} , enter the number where you want to mark your entry."
		num = gets.chomp.to_i
		if num>0 and num<10
			if arrp2.include?num or arrp1.include?num
				puts "The following entry has already been marked."
				take_inp1
			else
				arrp1.push(num)
				entry[num-1] = marker1
			end
		else
			puts "Enter number in range 1-9"
			take_inp1	
		end
	end

	def take_inp2
		display
		puts "#{player2}, enter the number where you want to mark your entry."
		num = gets.chomp.to_i
		if num>0 and num<10
			if arrp2.include?num or arrp1.include?num
				puts "The following entry has already been marked."
				take_inp2
			else
				arrp2.push(num)
				entry[num-1] = marker2
			end
		else
			puts "Enter number in range 1-9"
			take_inp2	
		end
	end	

	def winp1?
		for i in 1..3
			if arrp1.include? 3*i and arrp1.include? 3*i-1 and arrp1.include? 3*i-2
				return true
			elsif arrp1.include? i and arrp1.include? i+3 and arrp1.include? i+6
				return true
			end		
		end	
		if arrp1.include? 7 and arrp1.include? 5 and arrp1.include? 3
			return true
		elsif arrp1.include? 9 and arrp1.include? 5 and arrp1.include? 1
			return true
		else return false
		end
	end	

	def winp2?
		for i in 1..3
			if arrp2.include? 3*i and arrp2.include? 3*i-1 and arrp2.include? 3*i-2
				return true
			elsif arrp2.include? i and arrp2.include? i+3 and arrp2.include? i+6
				return true
			end		
		end	
		if arrp2.include? 7 and arrp2.include? 5 and arrp2.include? 3
			return true
		elsif arrp2.include? 9 and arrp2.include? 5 and arrp2.include? 1
			return true
		else return false
		end
	end
end


puts "Please enter name of first Player"
p1 = gets.chomp
puts "Please enter a single character to be used as marker for first Player"
m1 = gets.chomp[0]
puts "Please enter name of second Player"
p2 = gets.chomp
if p1 == p2
	p1 = p1 + "( P1)"
	p2 = p2 + " (P2)"
end
puts "Please enter a single character (other than #{m1}) to be used as marker for second Player"
m2 = gets.chomp[0]

while m2 == m1
	puts "Please enter a single character OTHER than #{m1}"
	m2 = gets.chomp[0]
end

game = Ttt.new(p1,m1,p2,m2)
for i in 1..2
	game.take_inp1
	game.take_inp2
end
game.take_inp1
k=0
while !(game.winp1?)
	if k==2
		puts "Game tied!!"
		break
	end
	game.take_inp2
	if game.winp2?
		break
	end
	game.take_inp1
	k=k+1
end	

game.display
if k!=2
	if game.winp1?
		puts "Congratuations, #{p1} won!!"
	elsif game.winp2?
		puts "Congratuations, #{p2} won!!"
	end
end
