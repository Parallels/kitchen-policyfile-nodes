# <a name="title"></a> Kitchen::PolicyfileNodes

A Test Kitchen Provisioner that copy Chef Client gererated JSON node from VM to Test Kitchen node path after successful converge.
It allows to do searches on other nodes described in .kitchen.yml.
kitchen-policyfile-nodes supports SSH and SFTP (kitchen-sync) transporters.

## <a name="installation"></a> Installation

```
gem install kitchen-policyfile-nodes
```

## <a name="config"></a> Configuration

Use `policyfile_nodes` instead of `policyfile_zero` for the kitchen provisioner name.

```
provisioner:
  name: policyfile_nodes
```

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="testing"></a> Testing

1. Run `rake` for unit testing

## <a name="authors"></a> Authors

Created and maintained by [Andrei Skopenko][author] (<andrei@skopenko.net>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])


[author]:           https://github.com/scopenco
[issues]:           https://github.com/scopenco/kitchen-policyfile-nodes/issues
[license]:          https://github.com/scopenco/kitchen-policyfile-nodes/blob/master/LICENSE
[repo]:             https://github.com/scopenco/kitchen-policyfile-nodes
[driver_usage]:     http://docs.kitchen-ci.org/drivers/usage
[chef_omnibus_dl]:  http://www.getchef.com/chef/install/
