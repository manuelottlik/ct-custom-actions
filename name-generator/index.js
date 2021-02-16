const core = require('@actions/core');
const github = require('@actions/github');
const { uniqueNamesGenerator, adjectives, colors, animals } = require('unique-names-generator');

try {
  const dicts = {
    '1': [animals],
    '2': [adjectives, animals],
    '3': [colors, adjectives, animals],
  }[core.getInput('length')]

  const randomName = uniqueNamesGenerator({
    dictionaries: dicts,
    separator: core.getInput('separator'),
  });
  
  core.setOutput("random-name", randomName);
} catch (error) {
  core.setFailed(error.message);
}