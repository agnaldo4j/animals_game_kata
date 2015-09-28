defmodule Question do
	@derive Access

	defstruct message: "", yes: %{}, no: %{}, animal: ""

	def prepareQuestion() do
		"Pense em um animal...\n"
	end

	def readyQuestion() do
		"Pensou?\n"
	end

	def firstQuestion() do
		prepareFirstQuestion(%Victory{}, %Learn{})
	end

	defp prepareFirstQuestion(victory, learn) do 
		%Question{ 
			message: "O animal que vc pensou vive na agua?\n",
			yes: %Question{
				message: "O animal que vc pensou é um(a) Tubarão?\n",
				yes: victory,
				no: learn,
				animal: "Tubarão"
			},
			no: %Question{
				message: "O animal que vc pensou é um(a) Leão?\n",
				yes: victory,
				no: learn,
				animal: "Leão"
			}
		}
	end

	def createQuestion(newHability, newAnimal, oldQuestion) do
		%Question{ 
			message: "O animal que vc pensou #{newHability}?\n",
			yes: %Question{
				message: "O animal que vc pensou é um(a) #{newAnimal}?\n",
				yes: oldQuestion.yes,
				no: oldQuestion.no,
				animal: newAnimal
			},
			no: oldQuestion
		}
	end
end