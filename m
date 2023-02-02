Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0518C636D3
	for <intel-gfx@archiver.kernel.org>; Thu,  2 Feb 2023 00:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E3E10E12C;
	Thu,  2 Feb 2023 00:12:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E8E410E0CE;
 Thu,  2 Feb 2023 00:12:54 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F0DB9A00E6;
 Thu,  2 Feb 2023 00:12:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Williamson" <alex.williamson@redhat.com>
Date: Thu, 02 Feb 2023 00:12:53 -0000
Message-ID: <167529677395.11114.17316471210234149452@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230201192010.42748-1-mjrosato@linux.ibm.com>
In-Reply-To: <20230201192010.42748-1-mjrosato@linux.ibm.com>
Subject: [Intel-gfx] =?utf-8?b?4pyXIEZpLkNJLkNIRUNLUEFUQ0g6IHdhcm5pbmcg?=
 =?utf-8?q?for_vfio=3A_fix_deadlock_between_group_lock_and_kvm_lock_=28rev?=
 =?utf-8?q?3=29?=
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

Series: vfio: fix deadlock between group lock and kvm lock (rev3)
URL   : https://patchwork.freedesktop.org/series/113535/
State : warning

== Summary ==

Error: dim checkpatch failed
c2474b730a36 vfio: fix deadlock between group lock and kvm lock
-:23: WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#23: 
> Fixes: 51cdc8bc120e ("kvm/vfio: Fix potential deadlock on vfio group_lock")

-:320: CHECK:UNCOMMENTED_DEFINITION: spinlock_t definition without comment
#320: FILE: drivers/vfio/vfio.h:77:
+	spinlock_t			kvm_ref_lock;

-:403: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 1 checks, 205 lines checked


