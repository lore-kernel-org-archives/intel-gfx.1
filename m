Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84966C5DF89
	for <intel-gfx@archiver.kernel.org>; Fri, 21 Aug 2026 12:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B287710E6E2;
	Fri, 21 Aug 2026 12:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QvrVdRkz";
	dkim-atps=neutral
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D66510E23D
 for <intel-gfx@lists.freedesktop.org>; Fri, 21 Aug 2026 01:45:15 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-66c7127a73dso516024d50.2
 for <intel-gfx@lists.freedesktop.org>; Thu, 20 Aug 2026 18:45:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787276714; cv=none;
 d=google.com; s=arc-20260327;
 b=nNwihTxnvumaz3cNYlbwkr6nFPoYd86ZTqqcyaWrvGZBEAj4Cd6v21qgBRcOriz9dK
 CLHGQShBpns79K5VL2GVn3ZBvKa3R+LENlJoS35jMVNSETsFTYAn4TTRHsblkQ56n3mP
 /XCE3Q83oxqBAzz+X21sehBj7BL3boKME12nSapo79Tpo0G8qraCViXvq5KutKYu64GR
 5828uMByunmwrjwGz9ax69lizhbC9HySCI0RDlgpnofLUrdwjRsIRxF+JqCn7Y4hY2TD
 T1PI0mq3lzd7NU9kb9o3xq5xOn30Z5GRCPQzNnJyL9eqPED30b35qkSF88Z8kctT+yel
 EtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
 fh=cKUy68CU4iKzeQZ6jXTeidR4Ug99ZQXHrPeJ/iUQBNc=;
 b=no+aaQd83Txn/oTGZXjRmerCGCU9W0wg/7O6JG4D5TO/02ghVY8AtwQll0N03MmrGr
 /VHo7hEhDltoQ3OOZH3dCgPhn3AUq4WVAGzActeP1Sr+0Wnb4AcXhhiMZ3/W7yLnyavR
 MUsaxdB1DaUe5ej2upiWkBasROnCAIQccHbuvm68wcaA2WptJH0zAn17+SJDvjEfQvSA
 LA0fGk2KtldOzN3t8K0a6nkieLGXT57wV69Gluoflz2fklA/AF8QH7yjC6R5E+65EWFa
 +Kn261BoybUkiqFSDjsuBUNOse6H9ogBswpuaDi9aDwHpnhP608BMhXWkKkLBALX7BeD
 18GA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787276714; x=1787881514; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
 b=QvrVdRkz5IcIeNlhXpt0PytbkjgOiJZSHNLj7uzuPn1qJiP0OQuISuTF0k2ZNcUDhl
 Z4Ty5DA9wmtpXARTJsI17y6p3qQEPvfFfyzRg1vqUZTVJ0nHt8AvGJDi42x1BLCIUF3/
 PavnF7qaTq4BI5N2/PDMAtB/3A+N8EzGgQyn88UUNEJ84uNP8inP+8Q9NvxsHfch1Vbd
 4CrKCCrreUVZmCtmh2whYPiX6LxthrEzowRFOq/McdZk4JYtuKqviDiX0DWagxK8VSF/
 T4hurJptyj33iuB9pNZVK+MTQgYBj8CTsL9YZ07Gi1bxlrqiowtDIkUJiLP2KW4M27Jp
 +m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787276714; x=1787881514;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ie2zZl8YsHAeQXHgNP1pjeAs7NQ+FFglXIo7DLINxR8=;
 b=ES8CT+mfcCjeySM87KAfn8i23EaPGCPipgRSJgL2Fg1O/rV6DRvGzu5Vz5AWL/fzIM
 /Az3tNNFZoYOpi6GxaVRBonfdL4xLlkrLAm/yngWozbAY0JZjRcOsLYdnoGbceSs/yDz
 BRg2c+hGWXFQH7iz2XJ5Zzcu/qz0ZHNfZoqaSzFT7qDOjCRC5ocdiBXs3BMDZf1l4aeC
 3beSAoUGR47zDq9eEZS3lwp8P7IO7BTZtzPhAKJeTWZCRE7Ev/bae2c4Lkh2+cIUMrBy
 YpNmXkj2MSdzEOcR8fNMlKgPNylcoG0dsS5y3doFgl4xaUTD35uyp5VN+0LwW3a0rPZd
 K8Aw==
X-Gm-Message-State: AFuF++lS4ELRqjJ6wzEvMIV62OjwdpzYhL2p5Gj44B33SenUUIiLd2x/
 +fr2e1TPCmrsL1uLRdKz5qa46mMR35bRt9Oxvd4/Tkvm7AQ8DgYtwIuri+O7FpWjql1prFfwsH/
 l/nMP8Pv66x7QYQK8PgzKYNX/6fCIbco=
X-Gm-Gg: AR+sD10U96u7SC0P1J9umsHtorXrVjpuD4hU++aTg/wUFggIPH3T6enOUEFSP9YoE/k
 5AZlztjNScbG+uwK+/86R8uj2jyM2YkMQR0m3MKEIuMJaKp89swB8o9wCCROIAlYCtpGNvLBxhs
 qIbZowIjuEvWFstYUnBvNjmCCaandz2jevpG6ZtlqQiZytFe+nmEEKFSJMrHVxZl9pxG+yZACwS
 tHuc3Taqlxn/YtVginOUu9l5XlDilatV4+vHUvrMoC+bK0e2dVuCkssQvOz3WjJWgcSpHoV4Brg
 QSd1ur+aPFq92hwhO/nGF9iRTvUnFWwHRP2UAduSupJVe1ryeQp3ld5MRyUgKRnr8Wy9ErzdcD8
 viNot89L8gNOILWAWdiB5yzYgRaSnfCnr+g==
X-Received: by 2002:a53:c052:0:20b0:66c:c998:f9d3 with SMTP id
 956f58d0204a3-66ce49a273cmr1032714d50.5.1787276714075; Thu, 20 Aug 2026
 18:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260813064902.367504-1-kartikey406@gmail.com>
In-Reply-To: <20260813064902.367504-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Fri, 21 Aug 2026 07:15:01 +0530
X-Gm-Features: AcwNN1V4dmKKGjPji2yVJLBTkyyZSgMh7TnOyiEqwl6nQbzA8cc22mdo1kQ-CyA
Message-ID: <CADhLXY6zACn7j=hSfj2jemjV7eFnVeAd4Dk_CVK4OKGu-KPX3g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Guard against NULL driver_data in
 i915_pci_probe()
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 simona@ffwll.ch, krzysztof.karas@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 21 Aug 2026 12:53:04 +0000
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, Aug 13, 2026 at 12:19=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> pci_match_device() can return the dummy pci_device_id_any entry
> when a device is force-bound via sysfs driver_override, in which
> case ->driver_data is unset (NULL). i915_pci_probe() casts it to
> struct intel_device_info * unconditionally and dereferences
> intel_info->require_force_probe, causing a NULL-ptr-deref.
>
> Reported-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Ddb96c5ff032f4292a8dc
> Tested-by: syzbot+db96c5ff032f4292a8dc@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v2: Drop Fixes tag, this isn't a regression from a single commit -
>     the unconditional dereference of ->driver_data has always assumed
>     it points into a MODULE_DEVICE_TABLE()-backed entry, an assumption
>     broken by the generic driver_override fallback path, not by any
>     i915-specific change. Add Cc: stable instead. (Krzysztof, Jani)
> ---
>  drivers/gpu/drm/i915/i915_pci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index 82415af47d54..2f03f95945f1 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -958,6 +958,9 @@ static int i915_pci_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>                 (struct intel_device_info *) ent->driver_data;
>         int err;
>
> +       if (!intel_info)
> +               return -ENODEV;
> +
>         if (intel_info->require_force_probe && !id_forced(pdev->device)) =
{
>                 dev_info(&pdev->dev,
>                          "Your graphics device %04x is not properly suppo=
rted by i915 in this\n"
> --
> 2.43.0
>

Gente Reminder. Let me know the status of this patch .

Thanks

Deepanshu
