class Linux
  #
  # Author: https://gist.githubusercontent.com/maxim/
  #
  def self.authorize_key_for_root(config, *key_paths)
    [*key_paths, nil].each do |key_path|
      if key_path.nil?
        fail "Public key not found at following paths: #{key_paths.join(', ')}"
      end

      full_key_path = File.expand_path(key_path)

      if File.exists?(full_key_path)
        config.vm.provision 'copy_public_key_to_guest',
          type: 'file',
          destination: '/home/vagrant/root_pubkey',
          source: full_key_path,
          run: 'once'

        config.vm.provision 'import_public_eys_to_root',
          type: 'shell',
          inline: %Q(
            echo 'Creating /root/.ssh/authorized_keys with #{key_path}' \
            && mkdir -p /root/.ssh/ \
            && rm -f /root/.ssh/authorized_keys \
            && mv /home/vagrant/root_pubkey /root/.ssh/authorized_keys \
            && chown root:root /root/.ssh/authorized_keys \
            && chmod 600 /root/.ssh/authorized_keys \
            && rm -f /home/vagrant/root_pubkey \
            && echo 'Done'
            ),
          privileged: true,
          run: 'once'
        break
      end
    end
  end
end
