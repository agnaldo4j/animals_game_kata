defmodule Question do
	@derive Access

	defstruct message: "", yes: %{}, no: %{}

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
				message: "O animal que vc pensou é um Tubarão?\n",
				yes: victory,
				no: learn
			},
			no: %Question{
				message: "O animal que vc pensou é um Leão?\n",
				yes: victory,
				no: learn
			}
		}
	end
end