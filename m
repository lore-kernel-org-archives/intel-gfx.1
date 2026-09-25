Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE35C9830D
	for <intel-gfx@archiver.kernel.org>; Fri, 25 Sep 2026 05:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C44E810F86B;
	Fri, 25 Sep 2026 05:00:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792CA10F86B;
 Fri, 25 Sep 2026 05:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/i915/hdcp=3A_Fail_fas?=
 =?utf-8?q?t_when_HDCP_Type_1_is_unsupported_via_MST_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "George D. Sworo" <george.d.sworo@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Fri, 25 Sep 2026 05:00:37 -0000
Message-ID: <179031243749.206281.18088152554320460264@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925035639.2034315-1-george.d.sworo@intel.com>
In-Reply-To: <20260925035639.2034315-1-george.d.sworo@intel.com>
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

Series: drm/i915/hdcp: Fail fast when HDCP Type 1 is unsupported via MST (rev2)
URL   : https://patchwork.freedesktop.org/series/174955/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/174955/revisions/2/mbox/ not applied
Applying: drm/i915/hdcp: refresh MST Type1 capability per sink
error: patch failed: drivers/gpu/drm/i915/display/intel_dp_mst.c:332
error: drivers/gpu/drm/i915/display/intel_dp_mst.c: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Using index info to reconstruct a base tree...
Patch failed at 0001 drm/i915/hdcp: refresh MST Type1 capability per sink
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


