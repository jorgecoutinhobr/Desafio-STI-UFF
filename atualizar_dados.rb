require 'csv'

module AtualizarDados
  PATH = './tabela/alunos.csv'

  def self.novo_uffmail(uffmail, matricula)
    dados = CSV.read(PATH, headers: true)
    dados.each do |dado|
      if matricula == dado['matricula']
        dado['uffmail'] = uffmail
      end
    end

    CSV.open(PATH, 'w', headers: true) do |csv|
      csv << dados.headers
      dados.each do |dado|
        csv << dado
      end 
    end
  end
end