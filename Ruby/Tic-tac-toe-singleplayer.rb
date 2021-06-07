class Ttt
	attr_accessor :player , :marker , :firstp , :com_mar , :entry , :arrp , :arrc , :depth
	def initialize(player, marker, firstp)
		@player = player
		@marker = marker
		@firstp = firstp
		if marker != 'X'
			@com_mar = 'X'
		else
			@com_mar = 'O'
		end
		@entry = [1,2,3,4,5,6,7,8,9]
		@arrp = []
		@arrc = []
		@depth = 0
	end

	def add_dep
		@depth=depth+1
	end

	def display
		puts "#{entry[0]} | #{entry[1]} | #{entry[2]}"
		puts "---------"
		puts "#{entry[3]} | #{entry[4]} | #{entry[5]}"
		puts "---------"
		puts "#{entry[6]} | #{entry[7]} | #{entry[8]}"
	end

	def take_inp1
		display
		puts "#{player} , enter the number where you want to mark your entry."
		num = gets.chomp.to_i
		if num>0 and num<10
			if arrc.include?num or arrp.include?num
				system "clear"
				puts "The following entry has already been marked."
				return take_inp1
			else
				arrp.push(num)
				entry[num-1] = marker
			end
		else
			system "clear"
			puts "Enter number in range 1-9"
			take_inp1	
		end
		add_dep
		system "clear"
	end

	def take_inp2
		display
		puts "Computer's turn."
		if depth == 0
			t = 2
		else
			trp=[]
			for i in arrp
				trp.push(i)
			end
			trc=[]
			for j in arrc
				trc.push(j)
			end
			dep = depth
			#inp=minimax(dep,trp,trc)
			mv = available_entry(trp,trc)
			sc = []
			for i in mv
				sc.push(mmax(0,trp,trc,i)-mmin(1,trp,trc,i))
			end
			t = mv[max_ind(sc)]
		end
		entry[t-1] = com_mar
		arrc.push(t)
	#print "#{game.mmax(a,arr,brr,i)} #{i}    "
	#end	
		add_dep
		system "clear"
	end	

	def win(arr)
		for i in 1..3
			if arr.include? 3*i and arr.include? 3*i-1 and arr.include? 3*i-2
				return true
			elsif arr.include? i and arr.include? i+3 and arr.include? i+6
				return true
			end		
		end	
		if arr.include? 7 and arr.include? 5 and arr.include? 3
			return true
		elsif arr.include? 9 and arr.include? 5 and arr.include? 1
			return true
		else 
			return false
		end
	end	

	def over(arr1,arr2)
		if (arr1.count + arr2.count == 9) or win(arr1) or win(arr2)
			return true
		else
			return false
		end
	end

	def score(dep,arr1,arr2)
		if win(arr1)
			return dep - 10
		elsif win(arr2)
			return 10 - dep
		else
			return 0
		end
	end	

	def available_entry(trp, trc)
		av = []
		for i in 1..9
			if !(trp.include? i or trc.include? i)
				av.push(i)
			end
		end
		return av
	end

	def max_ind(arr)
		t= arr.size-1
		m = arr[0]
		ind = 0
		for i in 0..t
			j=arr[i]
			if m < j
				m = j
				ind = i
			end
		end
		return ind
	end	

	def min_ind(arr)
		t=arr.size-1
		m = arr[0]
		ind = 0
		for i in 0..t
			j = arr[i]
			if m > j
				m = j
				ind = i
			end
		end
		return ind
	end	

	def com_turn(dep)
		if firstp
			if depth.even?
				return false
			else
				return true
			end
		else
			if depth.even?
				return true
			else
				return false
			end	 
		end
	end	
=begin
	def minimax(dep,trp,trc)
		if over(trp,trc)
			return score(dep,trp,trc)
		end
		#puts dep
		dep = dep + 1
		scores = []
		moves = available_entry(trp,trc)
		#puts dep
		if !com_turn(dep)
			for i in moves
				t = minimax(dep , trp, trc.push(i))
				#puts t
				scores.push(t)
				#scores.push(i)
				trc.pop()
			end
			#print trc
			if dep==depth
				print scores
				return moves[max_ind(scores)]
			else
				#puts dep
				return scores[max_ind(scores)]	
			end
		else
			for j in moves
				puts "vc"
				s = minimax(dep , trp.push(j), trc)
				scores.push(s)
				#scores.push(j)
				trp.pop()
			end
			#print trp
			if dep==depth
				print scores
				#puts dep
				return moves[min_ind(scores)]
			else
				#puts "was 2"
				return scores[min_ind(scores)]	
			end
		end
		#puts scores
		#return moves[scores.find_index(scores.max)]
	end
=end

	def mmax(dep,trp,trc,num)
		if over(trp,trc)
			return score(dep,trp,trc)
		else
			scores = []
			moves = available_entry(trp,trc)
			dep = dep+1
			trc.push(num)
			for i in moves
				t = mmin(dep,trp,trc,i)
				scores.push(t)
			end
			trc.pop()
			#if dep==depth+1
			#	print scores
			#	return moves[max_ind(scores)]
			#else
			return scores[max_ind(scores)]	
			#end
		end
	end		

	def mmin(dep,trp,trc,num)
		if over(trp,trc)
			return score(dep,trp,trc)
		else
			scores = []
			moves = available_entry(trp,trc)
			dep = dep+1
			trp.push(num)
			for i in moves
				t = mmax(dep,trp,trc,i)
				scores.push(t)
			end
			trp.pop()
			#if dep==depth+1
			#	print scores
			#	return moves[max_ind(scores)]
			#else
			return scores[min_ind(scores)]	
			#end
		end
	end		

	def run_game
		if not firstp
			while(!over(arrp,arrc))
				take_inp2
				if (over(arrp,arrc))
					#puts "Computer wins"
					break
				end
				take_inp1
			end
		else
			while(!over(arrp,arrc))
				take_inp1
				if over(arrp,arrc)
					#puts "#{player} wins"
					break
				end
				take_inp2
			end
		end
		display
		if win(arrp)
			puts "#{player} wins!!"
		elsif win(arrc)
			puts "Computer wins!!"
		else
			puts "Game draw!!"
		end
			
	end	
end

def startf
	puts "Do you want to start first? (y/n)"
whof = gets.chomp
if whof == 'y' or whof == 'Y'
	return true
elsif whof == 'n' or whof == 'N'
	return false
else 
	return startf
end
end

#=begin
puts "Welcome to the game!!"
puts "Please enter name of the Player"
p1 = gets.chomp
if p1 == 'Computer'
	p1 = p1 + ' (human)'
end
puts "Please enter a single character to be used as marker for first Player"
m1 = gets.chomp[0]
onef = startf
game = Ttt.new(p1,m1,onef)

#game.take_inp1
#game.take_inp2
#puts game.arrc
#puts game.arrp
#game.take_inp1
#game.take_inp2
#game.take_inp1
#game.take_inp2
#game.display
#=end

=begin
game = Ttt.new("a","b",false)
arr = [1,3]
brr = [7,9]
a = 0
#puts game.depth
#puts "#{game.minimax(a,arr,brr)} =>"
mv = game.available_entry(arr,brr)
sc = []
for i in mv
	sc.push(game.mmax(a,arr,brr,i)-game.mmin(a+1,arr,brr,i))
	#print "#{game.mmax(a,arr,brr,i)} #{i}    "
end	
print sc
puts " "
print mv
#game.display
#puts game.depth
=end
#puts game.available_entry(arr,brr)
game.run_game
