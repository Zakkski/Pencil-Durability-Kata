require_relative 'lib/router.rb'
require_relative 'lib/pencils_controller.rb'
require_relative 'lib/pencil.rb'


pencil = Pencil.new(durability: 15, eraser: 10, length: 2)
text = File.open('text/sample_text.txt').read

pencil_controller = PencilsController.new(pencil, text)
router = Router.new(pencil_controller)

router.run
