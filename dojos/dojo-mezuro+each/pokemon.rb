class Pokemon
	attr_accessor :hp, :nome, :ataques
	def initialize(hp,nome)
		@hp = hp
		@nome = nome
		@ataques = {}
	end

	def proximoAtaque
		@ataques.each do |nome, ataque|
			return nome if ataque.pp > 0
		end
		nil
	end

	def adicionaAtaque(nome, ataque)
		@ataques[nome] = ataque
	end

	def ataca(nomeataque, oponente)
		ataque = @ataques[nomeataque]

		puts self.nome + " ataca " + oponente.nome + " com " + nomeataque
		if ataque.podeAtacar?
			if self.errou?
				puts self.nome + " errou"
			else
				oponente.hp = oponente.hp - ataque.dano
				puts self.nome + ": " + self.hp.to_s
				puts oponente.nome + ": " + oponente.hp.to_s
			end

			ataque.gasta
		else
			puts nomeataque + " nao tem mais pp"
		end
	end

	def vivo?
		hp > 0
	end

	def errou?
		rand() <= 0.5
	end
end

class Ataque
	attr_accessor :dano, :pp
	def initialize(dano, pp)
		@dano = dano
		@pp = pp
	end

	def dano
		@dano
	end

	def gasta
		@pp -= 1
	end

	def podeAtacar?()
		@pp > 0
	end
end

class Treinador
	attr_reader :pokemons, :nome

	def initialize(pokemons, nome)
		@pokemons = pokemons
		@nome = nome
	end
end 

class Batalha

	def initialize(treinador1, treinador2)
		@treinador1 = treinador1
		@treinador2 = treinador2
	end

	def start
		puts "Começou a batalha!"
		pokemon1 = @treinador1.pokemons.pop
		pokemon2 = @treinador2.pokemons.pop
		while true
			atacante, atacado = [pokemon1, pokemon2].shuffle
			
			# break if not atacante.vivo?
			if attack1 = atacante.proximoAtaque
				atacante.ataca(attack1, atacado)
			end
			
			break if not atacado.vivo?
			if attack2 = atacado.proximoAtaque
				atacado.ataca(attack2, atacante)
			end

			break if not atacante.vivo?
			
			break if attack1.nil? && attack2.nil?
		end

		if !pokemon1.vivo?
			puts @treinador2.nome + " ganhou!!"
		elsif !pokemon2.vivo?
			puts @treinador1.nome + " ganhou!!!"
		else
			puts "Empate!!!"
		end
	end

end

tackle = Ataque.new(5, 10)
bubble = Ataque.new(3, 10)
scratch = Ataque.new(6, 15)
ember = Ataque.new(2, 15)

squirtle = Pokemon.new(20, "Squirtle")
squirtle.adicionaAtaque("tackle", tackle)
squirtle.adicionaAtaque("bubble", bubble)

charmander = Pokemon.new(20, "Charmander")
charmander.adicionaAtaque("scratch", scratch)
charmander.adicionaAtaque("ember", ember)

ash = Treinador.new([charmander], "Ash")
gary = Treinador.new([squirtle], "Gary")

battle = Batalha.new(ash, gary)
battle.start

