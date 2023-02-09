Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53546C05027
	for <intel-gfx@archiver.kernel.org>; Thu,  9 Feb 2023 23:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B4110EC01;
	Thu,  9 Feb 2023 23:50:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C8F310EC01;
 Thu,  9 Feb 2023 23:50:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0D254A03D2;
 Thu,  9 Feb 2023 23:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 09 Feb 2023 23:50:14 -0000
Message-ID: <167598661404.20200.14962033206940541326@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230209232228.859317-1-matthew.d.roper@intel.com>
In-Reply-To: <20230209232228.859317-1-matthew.d.roper@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_drm/i915/xehp=3A_LNCF/LBCF_workarounds_should_be_on_the_GT_?=
 =?utf-8?q?list?=
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

Series: drm/i915/xehp: LNCF/LBCF workarounds should be on the GT list
URL   : https://patchwork.freedesktop.org/series/113857/
State : warning

== Summary ==

Error: dim checkpatch failed
c4134c967979 drm/i915/xehp: LNCF/LBCF workarounds should be on the GT list
-:10: WARNING:TYPO_SPELLING: 'targetting' may be misspelled - perhaps 'targeting'?
#10: 
and tuning settings targetting them should be placed on the GT
                    ^^^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 138 lines checked


