# Kitchen::PolicyfileNodes

Provisioner `policyfile_nodes` extends `policyfile_zero` by adding one more step in the end of converge - it copies the resulted node
JSON object to the `nodes_path` on the host machine after successful converge. It allows you to use this node object for searches while converging another
Test Kitchen suites. So, you can use actual node IP addresses to communicate nodes with each other.

For example, 'web' node need to search 'db' node ip.
In `policyfile_zero` we have to create mock in node_path for this search. `policyfile_nodes` will create mock automatically.

`policyfile_nodes` supports SSH and SFTP (kitchen-sync) transporters.

## Requirements

* ChefDK 0.10.0+

## Installation

```
gem install kitchen-policyfile-nodes
```

## Configuration

Use `policyfile_nodes` instead of `policyfile_zero` for the kitchen provisioner name.

```
provisioner:
  name: policyfile_nodes
```

## Development

* Source hosted at [GitHub][https://github.com/Parallels/kitchen-policyfile-nodes]
* Report issues/questions/feature requests on [GitHub Issues][https://github.com/Parallels/kitchen-policyfile-nodes/issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Testing

1. Run `bundle install`
2. Run `rake` for unit testing

## Authors

Created and maintained by [Andrei Skopenko][author] (<andrei@skopenko.net>)

## License

Apache 2.0 (see [LICENSE][license])


[author]:           https://github.com/scopenco
[issues]:           https://github.com/Parallels/kitchen-policyfile-nodes/issues
[license]:          https://github.com/Parallels/kitchen-policyfile-nodes/blob/master/LICENSE
[repo]:             https://github.com/Parallels/kitchen-policyfile-nodes
[driver_usage]:     http://docs.kitchen-ci.org/drivers/usage
[chef_omnibus_dl]:  http://www.getchef.com/chef/install/
