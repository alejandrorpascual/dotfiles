import fs from 'fs/promises'
import yaml from 'js-yaml'

async function readFile(filePath: string) {
  try {
    const fileContents = await fs.readFile(filePath, 'utf-8')
    const obj = yaml.load(fileContents)
    console.log(obj)
  } catch (e) {
    console.error(e)
  }
}

const arg = process.argv[2]
readFile(arg)
