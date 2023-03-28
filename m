Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47145C76196
	for <intel-gfx@archiver.kernel.org>; Tue, 28 Mar 2023 08:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D072B10E81E;
	Tue, 28 Mar 2023 08:00:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F19F10E44D;
 Tue, 28 Mar 2023 08:00:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 55D51A0BCB;
 Tue, 28 Mar 2023 08:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Date: Tue, 28 Mar 2023 08:00:05 -0000
Message-ID: <167999040531.29054.12831892585628237598@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230327121116.1785979-1-imre.deak@intel.com>
In-Reply-To: <20230327121116.1785979-1-imre.deak@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_x86/topology=3A_fix_erroneous_smp=5Fnum=5Fsiblings_on_Intel?=
 =?utf-8?q?_Hybrid_platform_=28rev2=29?=
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: x86/topology: fix erroneous smp_num_siblings on Intel Hybrid platform (rev2)
URL   : https://patchwork.freedesktop.org/series/115661/
State : warning

== Summary ==

Error: dim checkpatch failed
3daf24e07285 x86/topology: fix erroneous smp_num_siblings on Intel Hybrid platform
-:57: WARNING:BAD_SIGN_OFF: 'Tested-by:' is the preferred signature form
#57: 
Tested-By: Jani Saarinen <jani.saarinen@intel.com> on local MTL setup. Also tested earlier on other CI systems

-:57: WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Jani Saarinen <jani.saarinen@intel.com> on local MTL setup. Also tested earlier on other CI systems', should be: 'Jani Saarinen <jani.saarinen@intel.com> (on local MTL setup. Also tested earlier on other CI systems)'
#57: 
Tested-By: Jani Saarinen <jani.saarinen@intel.com> on local MTL setup. Also tested earlier on other CI systems

total: 0 errors, 2 warnings, 0 checks, 17 lines checked


