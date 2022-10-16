class MobileGame 
    def play

    end
end

class GameForIOS < MobileGame
    def play
        puts "You play in Game for IOS"
    end
end

class GameForAndroid < MobileGame
    def play
        puts "You play in Game for Android"
    end
end

#Абстрактная фабрика
class MobileGameFactory
    def create_build
        
    end

    def upload

    end
end

#Конкетная фабрика №1
class IOSFactory < MobileGameFactory
    def create_build
        return GameForIOS.new
    end

    def upload
        puts "Upload Game in App Store"
    end
end

#Конкетная фабрика №2
class AndroidFactory < MobileGameFactory
    def create_build
        return GameForAndroid.new
    end

    def upload
        puts "Upload Game in Play Market"
    end
end


#Клиентский код
class GameBuilder
    attr_accessor :factory

    def initialize (factory)
        @factory = factory
    end

    def create_build
        return @factory.create_build
    end

    def upload
        @factory.upload
    end
end

def main
    print "Choice platform: 1 - IOS, 2 - Android\n>"

    input = gets.chomp

    case input
    when "1"
        factory = IOSFactory.new
    when "2"
        factory = AndroidFactory.new
    end

    game_builder = GameBuilder.new(factory)
    game = game_builder.create_build    
    game.play

    game_builder.upload
end

main