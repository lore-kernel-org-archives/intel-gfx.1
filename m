Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261E8CDE025
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Sep 2024 16:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73B510EBAA;
	Thu, 26 Sep 2024 16:56:11 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A821510E037;
 Thu, 26 Sep 2024 16:56:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_drm/display/dsc=3A_Refact?=
 =?utf-8?q?or_MST_DSC_Determination_Policy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Fangzhi Zuo" <jerry.zuo@amd.com>
Cc: intel-gfx@lists.freedesktop.org
Date: Thu, 26 Sep 2024 16:56:10 -0000
Message-ID: <172736977068.1108067.15892756846436328520@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240919173944.256887-1-Jerry.Zuo@amd.com>
In-Reply-To: <20240919173944.256887-1-Jerry.Zuo@amd.com>
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

Series: drm/display/dsc: Refactor MST DSC Determination Policy
URL   : https://patchwork.freedesktop.org/series/138989/
State : failure

== Summary ==

Error: patch https://patchwork.freedesktop.org/api/1.0/series/138989/revisions/1/mbox/ not applied
Applying: drm/display/dsc: Refactor MST DSC Determination Policy
Using index info to reconstruct a base tree...
M	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
M	drivers/gpu/drm/display/drm_dp_mst_topology.c
M	drivers/gpu/drm/i915/display/intel_dp.c
M	drivers/gpu/drm/i915/display/intel_dp_mst.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/gpu/drm/i915/display/intel_dp_mst.c
Auto-merging drivers/gpu/drm/i915/display/intel_dp.c
Auto-merging drivers/gpu/drm/display/drm_dp_mst_topology.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/display/drm_dp_mst_topology.c
Auto-merging drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0001 drm/display/dsc: Refactor MST DSC Determination Policy
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
Build failed, no error log produced


