
defmodule AnimalsGame do
	def question() do
		IO.gets Question.prepareQuestion()

		IO.gets Question.readyQuestion()

		question(Question.firstQuestion())
	end

	def question(question = %Question{}) do
		response = IO.gets question.message
		if (response == "sim\n") do 
			question(question.yes, question)
		else
			question(question.no, question)
		end
	end

	def question(question = %Question{}, state = %Question{}) do
		response = IO.gets question.message
		if (response == "sim\n") do 
			question(question.yes, question)
		else
			question(question.no, question)
		end
	end

	def question(victory = %Victory{}, state = %Question{}) do
		IO.puts victory.message
		response = IO.gets victory.playAgain
		if (response == "sim\n") do 
			question()
		else 
			IO.puts victory.bye
		end
	end

	def question(learn = %Learn{}, state = %Question{}) do
		IO.puts "Não terminado! ainda em desenvolvimento!"
	end
end