NADA = "."
NUVEM = "*"
AEROPORTO = "A"

entrada = File.read("input1.txt").split("\n")
mapa = entrada.collect do |linha|
	linha.split " "
end

def busca_elementos(mapa)
	aeroportos = []
	nuvens = []
	mapa.each_with_index do |linha,x|
		linha.each_with_index do |elemento,y|
			if elemento == AEROPORTO
				aeroportos << [x,y]
			elsif elemento == NUVEM
				nuvens << [x, y]
			end
		end
	end
	[aeroportos, nuvens]
end

def distancia(aeroporto, nuvem)
	x = (aeroporto[0] - nuvem[0]).abs
	y = (aeroporto[1] - nuvem[1]).abs
	x + y
end

def distancia_minima(aeroporto, nuvens)
	min_dist = []
	nuvens.each do |nuvem|
		min_dist << distancia(aeroporto, nuvem)
	end
	min_dist.min
end

def distancias_minima_e_maxima(aeroportos, nuvens)
	dist = []
	aeroportos.each do |aeroporto|
		dist << distancia_minima(aeroporto, nuvens)
	end
	[dist.min, dist.max]
end

aeroportos, nuvens = busca_elementos(mapa)	

resposta = distancias_minima_e_maxima(aeroportos, nuvens)
puts resposta[0]
puts resposta[1]