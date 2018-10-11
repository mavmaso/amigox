class SorteioService
  def self.draw(grupo)
    lista = grupo.user_groups
    ordenado = lista.shuffle
    ordenado.each_with_index do |item, index|
      v = Draw.new(group: grupo, sender_id: item.user_id, receiver_id: ordenado[index - 1])
      v.save
    end
  end
end