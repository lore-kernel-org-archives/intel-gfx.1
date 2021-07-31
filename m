Return-Path: <SRS0=VZzB=MX=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AE3C432BE
	for <intel-gfx@archiver.kernel.org>; Sat, 31 Jul 2021 00:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3076F60E94
	for <intel-gfx@archiver.kernel.org>; Sat, 31 Jul 2021 00:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3076F60E94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emeril.freedesktop.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64BC6F4DB;
	Sat, 31 Jul 2021 00:14:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0EE846F4D7;
 Sat, 31 Jul 2021 00:14:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BD78CA0118;
 Sat, 31 Jul 2021 00:14:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Sat, 31 Jul 2021 00:14:48 -0000
Message-ID: <162769048874.3955.52619694806665565@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20210731001019.150373-1-jose.souza@intel.com>
In-Reply-To: <20210731001019.150373-1-jose.souza@intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_series_starting_with_=5B1/4=5D_drm/i915/display/tgl+=3A_Dis?=
 =?utf-8?q?patch_atomic_commits_instead_of_front_buffer_modifications?=
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/4] drm/i915/display/tgl+: Dispatch atomic commits instead of front buffer modifications
URL   : https://patchwork.freedesktop.org/series/93252/
State : warning

== Summary ==

$ dim checkpatch origin/drm-tip
762853c5a7c2 drm/i915/display/tgl+: Dispatch atomic commits instead of front buffer modifications
d75f9be16572 drm/i915/display: Fix sel fetch plane offset calculation
06de84df5401 drm/i915: Nuke ORIGIN_GTT
87fee2709b10 DO_NOT_MERGE: drm/i915/display: Enable PSR2 selective fetch by default
-:14: WARNING:TYPO_SPELLING: 'happend' may be misspelled - perhaps 'happened'?
#14: 
- kms_cursor_legacy: all tests that checks if evasion happend, I have
                                                      ^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 23 lines checked


