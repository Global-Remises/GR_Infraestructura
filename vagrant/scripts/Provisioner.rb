class Provisioner
	def self.run(config, settings)
		root_dir = File.dirname(File.expand_path('..', __FILE__))
		provision_dir = "#{root_dir}/provision"
		scripts_dir = "#{root_dir}/scripts"

	    # Run initial provisioning
	    if !settings['disable']
	    	settings['disable']=""
	    end
    	Dir.foreach(provision_dir) do |item|

		next if item == '.' || item == '..' || item == '.gitignore' || settings['disable'].include?(item.chomp('.sh'))
			config.vm.provision 'shell' do |s|
				s.name = 'Running ' + item
				s.path = provision_dir + '/' + item
				s.privileged = false
				s.keep_color = true
			end
		end
	end
end