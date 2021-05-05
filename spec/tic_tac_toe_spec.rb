require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

module TicTacToe
    describe Game do
      let(:mockPlayer) { double(player1: 'Safa', player2: 'Moises') }
      let(:game) { Game.new(mockPlayer) }
      describe '.initialize' do
        it 'return the name of the players' do
          expect(game.player.player1).to eq 'Safa'
        end
        it 'raise error if there is no arguments' do
          expect { Game.new }.to raise_error
        end
      end
  
      describe '#human_move_to_coordinate' do
        it 'return the coordinates' do
          expect(game.human_move_to_coordinate('3')).to eq [0, 2]
        end
      end
      describe '#check_if_draw' do
        it 'return nil if there is numbers left' do
          expect(game.check_if_draw).to eq nil
        end
  
        it 'return true if there is not numbers left' do
          game.board.grid = [%w[x o x], %w[x o x], %w[x o x]]
          game.stub(:check_if_draw) { true unless game.board.grid.flatten.any?(Numeric) }
          expect(game.check_if_draw).to eq true
        end
  
        it 'raise erro without stub(:check_if_draw)' do
          game.board.grid = [%w[x o x], %w[x o x], %w[x o x]]
          expect { game.check_if_draw }.to raise_error
        end
      end
  
      describe '#posible_winning' do
        it 'return array with all the possibilities' do
          wins = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
          expect(game.posible_winning).to eq wins
        end
      end
  
      describe '#check_if_winner' do
        it 'false if all the values in the array are not the same' do
          expect(game.check_if_winner).to eq false
        end
  
        it 'false if all the values in the array are not the same' do
          game.board.grid = [%w[x x x], %w[x o x], %w[x o x]]
          expect(game.check_if_winner).to eq true
        end
      end
  
      describe '#play' do
        it 'return nil' do
          game.stub(:play) { nil unless game.check_if_winner }
          expect(game.play).to eq nil
        end
  
        it 'raise erro without stub(:play)' do
          expect { game.play }.to raise_error
        end
  
        it 'return nil' do
          game.board.grid = [%w[x x x], %w[x o x], %w[x o x]]
          game.stub(:play) { nil unless game.check_if_winner }
          expect(game.play).to eq nil
        end
      end
    end

    describe Player do
        describe '#initialize' do
          it 'save two plyers' do
            player = Player.new('Safa', 'Moises')
            expect(player.player1).to eq 'Safa'
          end
    
          it 'save two plyers' do
            player = Player.new('Safa', 'Moises')
            expect(player.player2).to eq 'Moises'
          end
    
          it 'thrown error if no arguments' do
            expect { Player.new }.to raise_error
          end
        end
      end

      describe Board do
        let(:board) { Board.new }
        let(:arr) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    
        describe '.initialize' do
          it 'return three nested arrys' do
            expect(board.grid).to eq arr
          end
        end
    
        describe '#default_grid' do
          it 'return three nested arrys' do
            expect(board.default_grid).to eq arr
          end
        end
    
        describe '#get_cell' do
          it 'return number nine' do
            expect(board.get_cell(2, 2)).to eq 9
          end
    
          it 'raise error if not arguments' do
            expect { board.get_cell }.to raise_error
          end
        end
    
        describe '#set_cell' do
          it 'return and X' do
            expect(board.set_cell(2, 2, 'X')).to eq 'X'
          end
    
          it 'raise error if not arguments' do
            expect { board.set_cell }.to raise_error
          end
        end
      end
  end