import fs from 'fs/promises'
import path from 'path'
import yaml from 'js-yaml'
import deepcopy from 'deepcopy'
import {AlacrittyTypes} from './types/alacrittyTypes'

type Schemes = 'nightfox' | 'dawnfox' | undefined

async function readFile(filePath: string, theme: Schemes) {
  if (!theme) {
    throw new Error('Enter dawnfox or nightfox as a second argument')
  }

  try {
    console.log('path.dirname(filePath) :>> ', path.dirname(filePath));
    await fs.copyFile(filePath, 'alacritty-backup.yml')
    const fileContents = await fs.readFile(filePath, 'utf-8')
    const oldObj = yaml.load(fileContents) as AlacrittyTypes
    const newObj = deepcopy(oldObj)

    if (theme === 'dawnfox') {
      newObj.colors = newObj.schemes.DawnFox
    } else {
      newObj.colors = newObj.schemes.NighFox
    }

    console.log(yaml.dump(newObj, {indent: 2}))
    // await fs.writeFile(filePath, yaml.dump(obj))
  } catch (e) {
    console.error(e)
  }
}

// FIX: type casting
const [, , filePath, theme] = process.argv as [string, string, string, Schemes]
readFile(filePath, theme)
