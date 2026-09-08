Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72D1C79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BF910EDE8;
	Tue,  8 Sep 2026 23:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SCRraPEi";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09FF10EDE8
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:26:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EFC242DF0;
 Tue,  8 Sep 2026 23:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAE11F00A3A;
 Tue,  8 Sep 2026 23:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788909962;
 bh=2gXo3ljwX+a3SLzR2j3mlR8ttxfMruRRklPBbeG2Nhc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SCRraPEibWfTJeAH9nnpmRtbBnIGENKS//zN9GKMIMPhpnXPUUKFXDYlGTh7AtQc4
 1nPja1O45MjBQ85ay0EuoefTAXaI9x6Fcvfa4RridDbd+8AcYBZCD1ycwv4T48y64+
 r2g83agIs1cHJT6jjdwyiIH2WzHVy51YZDZ6z/A4n4662hHPOFFL2jrSk5NAcElA1q
 9mC90Xoc3IkY037UFIwHsz2zBEYUXyq0qumJqtYoEh5zTzhp18afO1pboYeCBX3xeL
 miU63LlB0VIDDtHGkBO4OrJbaC5n4oqWnwpQqGj2/owOLS2qpvaI6r+YOR+8Bvno5N
 SBVeuU/rQ+47w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/i915/perf: Remove sysfs group on OA config
 idr_alloc() failure
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260908231511.1217426-6-umesh.nerlige.ramappa@intel.com>
References: <20260908231511.1217426-4-umesh.nerlige.ramappa@intel.com>
 <20260908231511.1217426-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 23:26:01 +0000
Message-Id: <20260908232601.DBAE11F00A3A@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Concurrent execution of i915_perf_add_config_ioctl and i915_pe=
rf_unregister can lead to a Use-After-Free of perf->metrics_kobj.
--

commit e80590029db9506ad40df9f792adcff0ddb3c4d7
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/i915/perf: Remove sysfs group on OA config idr_alloc() failure

This commit fixes a resource leak where an OA config's sysfs group was not
removed if idr_alloc() failed. It adds a new remove_sysfs error path to
clean up the sysfs group.

> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915=
_perf.c
> index 96823dcd3fae2..abda7b1c49569 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
[ ... ]
> @@ -4738,6 +4738,8 @@ int i915_perf_add_config_ioctl(struct drm_device *d=
ev, void *data,
> =20
>  	return id;
> =20
> +remove_sysfs:
> +	sysfs_remove_group(perf->metrics_kobj, &oa_config->sysfs_metric);

[Severity: Critical]
This is a pre-existing issue, but can this sequence lead to a Use-After-Free
of perf->metrics_kobj during a concurrent hardware hot-unplug?

If a user-space process repeatedly calls the DRM_IOCTL_I915_PERF_ADD_CONFIG
ioctl while the driver is being unbound:

CPU1 (Hot-unplug/Unbind)
i915_perf_unregister()
    kobject_put(perf->metrics_kobj);
    perf->metrics_kobj =3D NULL;

CPU2 (ioctl)
i915_perf_add_config_ioctl()
    // passes early NULL check for perf->metrics_kobj before CPU1 clears it

Then CPU2 could eventually reach this newly added error path (or the existi=
ng
create_dynamic_oa_sysfs_entry() call) and pass the freed perf->metrics_kobj
pointer to sysfs_remove_group(), causing a Use-After-Free.

Since i915_driver_unregister() calls i915_perf_unregister() before calling
drm_dev_unplug(), the DRM core hasn't yet blocked incoming ioctls.

Does this lockless teardown of the kobject require synchronization or holdi=
ng
a reference during the ioctl?

>  sysfs_err:
>  	mutex_unlock(&perf->metrics_lock);
>  reg_err:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908231511.1217=
426-4-umesh.nerlige.ramappa@intel.com?part=3D2
