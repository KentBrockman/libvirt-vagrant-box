Vagrant.configure("2") do |config|
         config.vm.provider :libvirt do |libvirt|
         libvirt.driver = "kvm"
         libvirt.host = 'localhost'
         libvirt.uri = 'qemu:///system'
         end
config.vm.define "new" do |custombox|
         custombox.vm.box = "pop_os_2110"       
         custombox.vm.provider :libvirt do |test|
         test.memory = 4096
         test.cpus = 2
         end
         end
end

