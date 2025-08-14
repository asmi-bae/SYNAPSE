package com.github.continuedev.continueintellijextension.`synapse`.process

import java.io.InputStream
import java.io.OutputStream

interface ContinueProcess {

    val input: InputStream
    val output: OutputStream

    fun close()

}
