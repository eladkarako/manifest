<h1>manifest</h1>
<br/>
<img alt="" src="icon.png" />
<br/>
<h3>The Easiest Way of setting a <strong>manifest</strong><br/>
as an <strong>embedded resource</strong> into your execute or library.</h3>
<br/>

This repository contains:
<ul>
<li><code>mt.exe</code> - Microsoft Manifest Tool v5.2.3790.2076 (from WinSDK 7.1), It is the 32bit version by it will works just fine for 64bit apps too</li>
<li><code>generic.manifest</code> - A generic manifest that only has the important compability section, running permissions and few settings to enable. It can be safely embedded in both execute/library files. It does not contain the identify-assembly or any file-specific details.</li>
<li><code>add_manifest.cmd</code> - drag&amp;drop your exe/sfx/dll files over this batch file, it will backup your original file and will replace the manifest resource with the content of <code>generic.manifest</code> (binary modification).</li>
<li><code>copy_manifest.cmd</code> - drag&amp;drop your exe/sfx/dll files over this batch file and you'll get a copy of the generic-manifest as a side-by-side (external) file, near your target file (no modification).</li>
</ul>

<hr/>

How to use - Example:
<ol>
<li>Download <a href="https://github.com/mcmilk/7-Zip-zstd/releases/">7-Zip-zstd</a></li>
<li>Once downloaded, extracted on to your desktop and inspected you've found out that exe, sfx and dll file are lacking any <code>manifest</code>.</li>
<li>Download <a href="https://github.com/eladkarako/manifest/archive/master.zip">github.com/eladkarako/manifest/archive/master.zip</a> and extract on to your desktop.</li>
<li>select all the exe, sfx and dll files together, in the <code>7-Zip-zstd</code> folder, then - drag&amp;drop them over <code>add_manifest.cmd</code></li>
<li>Done.<br/>Each of the files will now have this manifest as an internal-resource (RES-24).</li>
</ol>

Note that any existing manifest resource will be overwritten with the generic-one,<br/>
so either make a backup of the manifest or the exe itself.

<hr/>

if DPI-Awareness is giving you a bad time,<br/>
you can rename <code>generic_alternative_no_dpi_awareness.manifest</code> to <code>generic.manifest</code>,<br/>
it will set the older <code>dpiAware</code>, the newer (used in Windows 10): <code>dpiAwareness</code> and a DPI based text-scaling all to <strong>false</strong>.


<hr/>

When resource-editing is not possible,<br/>
for example, when the exe was patched/reverse-engineered<br/>
or built using MinGW/GCC (for example...) without proper linking<br/>
- or if modification to the file is not desirable,<br/>
try using the <a href="https://gist.github.com/eladkarako/d24d5ed3c917ef230b0fc990104f9fe6#file-manifest-prefer-external-side-by-side-file-over-internal-resource-reg">registry fix for preferring a side-by-side over embedded resource</a>,<br/>
and simply make a copy of the generic manifest at the same folder as the target exe/sfx/dll file (you can use <code>copy_manifest.cmd</code> for that).