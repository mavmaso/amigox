class SorteioService
  def self(grupo)
    lista = grupo.user_groups
    ordenado = lista.shuffle
    ordenado.each_with_index do |item, index|
      Draw.new(group: grupo, sender: item, receiver: ordenado[index - 1])
    end
  end
end