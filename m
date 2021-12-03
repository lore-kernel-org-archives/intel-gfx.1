Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8DCC433F5
	for <intel-gfx@archiver.kernel.org>; Fri,  3 Dec 2021 22:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AFC8BEA3;
	Fri,  3 Dec 2021 22:27:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 345E28BEA3;
 Fri,  3 Dec 2021 22:27:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2CBE1A0169;
 Fri,  3 Dec 2021 22:27:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Date: Fri, 03 Dec 2021 22:27:13 -0000
Message-ID: <163857043316.5407.10739772615643638072@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20211203183339.3276250-1-John.C.Harrison@Intel.com>
In-Reply-To: <20211203183339.3276250-1-John.C.Harrison@Intel.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkRPQ1M6IHdhcm5pbmcgZm9yIFVw?=
 =?utf-8?q?date_to_GuC_version_69=2E0=2E0?=
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

Series: Update to GuC version 69.0.0
URL   : https://patchwork.freedesktop.org/series/97564/
State : warning

== Summary ==

$ make htmldocs 2>&1 > /dev/null | grep i915
/home/cidrm/kernel/Documentation/gpu/i915:542: ./drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h:44: WARNING: Inline target start-string without end-string.
/home/cidrm/kernel/Documentation/gpu/i915:542: ./drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h:48: WARNING: Inline target start-string without end-string.
/home/cidrm/kernel/Documentation/gpu/i915:542: ./drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h:52: WARNING: Inline target start-string without end-string.


