require './busca_aluno'

module GerarEmail
  def self.opcoes(nome, sobrenome, matricula)
    nome = nome.downcase
    sobrenome = sobrenome.downcase
    emails = [
      "#{nome}_#{sobrenome[0..3]}@id.uff.br",
      "#{sobrenome[0..3]}-#{nome}#{matricula[-3..-1]}@id.uff.br",
      "#{nome[0..3]}#{sobrenome[0..3]}#{matricula[-3..-1]}@id.uff.br",
      "#{nome}#{sobrenome[0]}#{matricula[0..3]}@id.uff.br",
      "#{nome[-4..-1]}#{sobrenome[0..3]}#{matricula[0..3]}@id.uff.br"
    ]

    emails.reject { |email| BuscaAluno.por_uffmail(email) }
  end
end