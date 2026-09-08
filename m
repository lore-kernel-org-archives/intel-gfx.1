Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4ACC79F82
	for <intel-gfx@archiver.kernel.org>; Tue,  8 Sep 2026 23:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84EA810EDE9;
	Tue,  8 Sep 2026 23:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PNvEpufk";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948CF10EDE9
 for <intel-gfx@lists.freedesktop.org>; Tue,  8 Sep 2026 23:29:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B92B5601DE;
 Tue,  8 Sep 2026 23:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455E11F00A3A;
 Tue,  8 Sep 2026 23:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788910194;
 bh=pUu7LRzvFYJurCTaFZ+m8Al5aB83O20C8PpBUIGySJw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PNvEpufkPY83ucFF/pbU0G/xoyX/Hogx80An+52Rd2kln0+yfcHlz1Yk4N6oyahMW
 2cKpS6ZDjfh3pJqGxR3uFbMZtlUpRRrfsL8p642+scPtvt7OCjjtWEqks8SgF1e82s
 VXVKRNVWqoMaJp6vbV8ltZbtnpyEJ60VS7v136pm9THkX4Qd2yXRo4CXs/pbWljeI1
 A8qWK7n4QyW4rnw8oAzung+IBk6UZv589DyMkcP8nOdKssmB0StO/iI3jEoWX7zz3j
 fuf23B2mDBTh8J4cvhQZ4A8l9dg9lgT5JbV7H8xePQ88pqvHbnU+W4bAmZBSc8nCjS
 RBwNsFIPp5UPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] drm/i915/perf: Enable the stream before installing
 its fd
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-gfx@lists.freedesktop.org
In-Reply-To: <20260908231511.1217426-5-umesh.nerlige.ramappa@intel.com>
References: <20260908231511.1217426-4-umesh.nerlige.ramappa@intel.com>
 <20260908231511.1217426-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 23:29:53 +0000
Message-Id: <20260908232954.455E11F00A3A@smtp.kernel.org>
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
- [Critical] File descriptor exposure race leading to use-after-free on `dr=
m_device` due to unbalanced `drm_dev_put()`.
--

commit c98885955ea0ce4ff5699cebc897dbb4dbd8246b
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/i915/perf: Enable the stream before installing its fd

This commit moves the enablement of the perf stream to occur before
installing the file descriptor in userspace. This prevents a race
condition where an I915_PERF_IOCTL_DISABLE ioctl could run concurrently
with stream enablement.

> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915=
_perf.c
> index 19b82427aa412..96823dcd3fae2 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
[ ... ]
> @@ -3900,15 +3900,25 @@ i915_perf_open_ioctl_locked(struct i915_perf *per=
f,
[ ... ]
> +	if (!(param->flags & I915_PERF_FLAG_DISABLED))
> +		i915_perf_enable_locked(stream);
> +
>  	stream_fd =3D anon_inode_getfd("[i915_perf]", &fops, stream, f_flags);
>  	if (stream_fd < 0) {
>  		ret =3D stream_fd;
> -		goto err_flags;
> +		goto err_enable;
>  	}
> =20
> -	if (!(param->flags & I915_PERF_FLAG_DISABLED))
> -		i915_perf_enable_locked(stream);
> -
>  	/* Take a reference on the driver that will be kept with stream_fd
>  	 * until its release.
>  	 */

[Severity: Critical]
This is a pre-existing issue, but does anon_inode_getfd() expose the file
descriptor to userspace before the drm_device reference count is acquired?

Since anon_inode_getfd() installs the file descriptor in the process's fd
table, it becomes immediately visible to userspace. A concurrent thread
could guess the fd and call close() before the original ioctl thread in
i915_perf_open_ioctl_locked() has a chance to execute the subsequent
drm_dev_get().

If close() is called concurrently, it invokes i915_perf_release(), which
unconditionally calls drm_dev_put(&perf->i915->drm). Because the original
thread has not yet called drm_dev_get(), could this prematurely decrement
the reference count?

By racing multiple I915_PERF_OPEN ioctls with concurrent close() calls,
could this drive the drm_device refcount to 0, leading to a use-after-free
when the original thread finally executes drm_dev_get()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908231511.1217=
426-4-umesh.nerlige.ramappa@intel.com?part=3D1
