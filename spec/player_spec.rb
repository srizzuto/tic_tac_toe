require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

module TicTacToe
    describe Player do
      describe '#initialize' do
        it 'save two plyers' do
          player = Player.new('Player1', 'Player2')
          expect(player.player1).to eq 'Player1'
        end
  
        it 'save two plyers' do
          player = Player.new('Player1', 'Player2')
          expect(player.player2).to eq 'Player2'
        end
  
        it 'thrown error if no arguments' do
          expect { Player.new }.to raise_error
        end
      end
    end
end
