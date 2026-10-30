Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE338606A31A
	for <intel-gfx@archiver.kernel.org>; Fri, 30 Oct 2026 09:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381521126E9;
	Fri, 30 Oct 2026 09:58:19 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0699D1126E9;
 Fri, 30 Oct 2026 09:58:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/ddi=3A_add_DDI_A?=
 =?utf-8?q?_force_4_lanes_quirk_for_Apple_MacBookPro11=2C_5_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Theo Andersen Carton" <andersen.theo@gmail.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 30 Oct 2026 09:58:18 -0000
Message-ID: <179335429802.92588.234795017499514692@221881a7231d>
X-Patchwork-Hint: ignore
References: <20260917185235.23792-1-andersen.theo@gmail.com>
In-Reply-To: <20260917185235.23792-1-andersen.theo@gmail.com>
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
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/ddi: add DDI A force 4 lanes quirk for Apple MacBookPro11, 5 (rev5)
URL   : https://patchwork.freedesktop.org/series/174000/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/174000/revisions/5/mbox/ not applied
Applying: drm/i915/ddi: add DDI A force 4 lanes quirk for Apple MacBookPro11, 5
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/i915/display/intel_ddi.c
M	drivers/gpu/drm/i915/display/intel_quirks.c
M	drivers/gpu/drm/i915/display/intel_quirks.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/display/intel_quirks.h
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_quirks.h
Auto-merging drivers/gpu/drm/i915/display/intel_quirks.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/i915/display/intel_quirks.c
Auto-merging drivers/gpu/drm/i915/display/intel_ddi.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/i915/ddi: add DDI A force 4 lanes quirk for Apple MacBookPro11, 5
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


