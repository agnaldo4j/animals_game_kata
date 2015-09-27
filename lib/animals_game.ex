
defmodule AnimalsGame do
	def question() do
		IO.gets Question.prepareQuestion()

		IO.gets Question.readyQuestion()

		question(Question.firstQuestion())
	end

	def question(%Question{message: message, yes: yes, no: no}) do
		response = IO.gets message
		if (response == "sim\n") do 
			question(yes)
		else 
			question(no)
		end
	end

	def question(%Victory{bye: bye, message: message, playAgain: playAgain}) do
		IO.puts message
		response = IO.gets playAgain
		if (response == "sim\n") do 
			question()
		else 
			IO.puts bye
		end
	end

	def question(%Learn{currentAnimal: currentAnimal, animalMessage: animalMessage, hability: hability}) do
		IO.puts "Não terminado! ainda em desenvolvimento!"
	end
end