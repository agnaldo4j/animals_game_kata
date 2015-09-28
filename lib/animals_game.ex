
defmodule AnimalsGame do
	@derive Access

	def start() do
		IO.gets Question.prepareQuestion()

		IO.gets Question.readyQuestion()

		_questionLooper(Question.firstQuestion())
	end

	defp _questionLooper(question = %Question{}) do
		response = IO.gets question.message
		if (response == "sim\n") do 
			newState = %{question | yes: _question(question.yes)}
		else
			newState = %{question | no: _question(question.no)}
		end
		_questionLooper(newState)
	end

	defp _question(question = %Question{}) do
		response = IO.gets question.message
		if (response == "sim\n") do 
			%{question | yes: _question(question.yes)}
		else
			if(question.no == %Learn{}) do
				_question(question.no, question)
			else
				%{question | no: _question(question.no)}
			end
		end
	end

	defp _question(victory = %Victory{}) do
		IO.puts victory.message
		response = IO.gets victory.playAgain
		if (response == "sim\n") do 
			victory
		else 
			IO.puts victory.bye
			System.halt
		end
	end

	defp _question(learn = %Learn{}, state = %Question{}) do
		newAnimal = IO.gets learn.animalMessage
		newHability = IO.gets "O que um #{newAnimal} faz que um(a) #{state.animal} não?\n"
		
		Question.createQuestion(newHability, newAnimal, state)
	end
end