Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45289606A31E
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 01:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6C410F93F;
	Wed, 25 Nov 2026 01:11:02 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A03710F938;
 Wed, 25 Nov 2026 01:11:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0898848461314732290=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/i915/display=3A_don=27t_be_cute_about_printing_enabling?=
 =?utf-8?q?/disabling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Wed, 25 Nov 2026 01:11:02 -0000
Message-ID: <179556906216.81576.4381792684183750444@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124141146.1560208-1-jani.nikula@intel.com>
In-Reply-To: <20261124141146.1560208-1-jani.nikula@intel.com>
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0898848461314732290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/i915/display: don't be cute about printing enabling/disabling
URL   : https://patchwork.freedesktop.org/series/179505/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_19604 -> Patchwork_179505v1
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/index.html

Participating hosts (40 -> 38)
------------------------------

  Missing    (2): bat-dg2-13 bat-adls-6 

Known issues
------------

  Here are the changes found in Patchwork_179505v1 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_debugfs@read-all-entries:
    - bat-adlp-6:         [PASS][1] -> [DMESG-WARN][2] ([i915#15673])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19604/bat-adlp-6/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/bat-adlp-6/igt@core_debugfs@read-all-entries.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - bat-adlp-6:         [DMESG-WARN][3] ([i915#15673]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19604/bat-adlp-6/igt@core_auth@basic-auth.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/bat-adlp-6/igt@core_auth@basic-auth.html

  
  [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673


Build changes
-------------

  * Linux: CI_DRM_19604 -> Patchwork_179505v1

  CI-20190529: 20190529
  CI_DRM_19604: 59b46a8902d6416190f72ddc25ba74881639af3a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGT_9203: 9203
  Patchwork_179505v1: 59b46a8902d6416190f72ddc25ba74881639af3a @ git://anongit.freedesktop.org/gfx-ci/linux

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/index.html

--===============0898848461314732290==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/i915/display: don&#x27;t be cute about printing enabling/disabling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179505/">https://patchwork.freedesktop.org/series/179505/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_19604 -&gt; Patchwork_179505v1</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/index.html</p>
<h2>Participating hosts (40 -&gt; 38)</h2>
<p>Missing    (2): bat-dg2-13 bat-adls-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in Patchwork_179505v1 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_debugfs@read-all-entries:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19604/bat-adlp-6/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/bat-adlp-6/igt@core_debugfs@read-all-entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_auth@basic-auth:<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19604/bat-adlp-6/igt@core_auth@basic-auth.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673">i915#15673</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_179505v1/bat-adlp-6/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: CI_DRM_19604 -&gt; Patchwork_179505v1</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19604: 59b46a8902d6416190f72ddc25ba74881639af3a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGT_9203: 9203<br />
  Patchwork_179505v1: 59b46a8902d6416190f72ddc25ba74881639af3a @ git://anongit.freedesktop.org/gfx-ci/linux</p>

</body>
</html>

--===============0898848461314732290==--
